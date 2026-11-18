# Issue

**Title:** Enable pg_trgm extension and add trigram index for class instance names

## Description

This adds a trigram index to the class_instance table to speed up name queries that involve wildcards and regular expressions. These are common, especially in the Neuron Search widget. Since we also allow wildcards at the end of a name (e.g. when searching for a neuron name), B-tree can't be used. Trigram however works fine with this and is included in a regular Postgres setup. It only needs to be enabled through an extension.

For small instances, these queries are already fast. However on large instances, sequential scans on the class_instance table can be quite slow when doing name lookups. For instance, in a large test instance I have 215,707,715 class instance entries ans looking for a name takes about ~30 seconds on a heavily optimized Postgres database. Using the
trigram index bring this down to 2 ms (!). The size of this index is comparable to the foreign key index. The example table has a size of 19 GB, the primary key index is ~4.5 GB and the trigram index ~5 GB. Given that neuron name search and annotation search is done a lot, I feel this increase in space requirement is justified.

For most setups this shouldn't require manual changes, but in case the CATMAID Postgres user doesn't have enough permissions, the extension needs to installed manually using `CREATE EXTENSION pg_trgm;` in the CATMAID database.

This index is added as PR for documentation purposes and to get feedback in case there is disagreement on adding this new Postgres extension. Since this extension comes already bundled with Postgres, I believe it is fine to not make this optional.

A simple name search looks like this (typing "aSIP" into the neuron name search):

```
  SELECT ci.id, ci.user_id, ci.creation_time, ci.edition_time,
    ci.project_id, ci.class_id, ci.name, skel_link.skeletons
  FROM class_instance ci
  LEFT JOIN LATERAL (
    SELECT cici_n.class_instance_b AS id,
      array_agg(cici_n.class_instance_a) AS skeletons
    FROM class_instance_class_instance cici_n
    WHERE cici_n.class_instance_b = ci.id
      AND cici_n.relation_id = 10
    GROUP BY 1
  ) skel_link ON ci.id = skel_link.id
  WHERE ci.project_id = 1
    AND ci.class_id = ANY (ARRAY[3,6])
    AND ci.name ~~* '%aSIP%'
  ORDER BY id ASC;
```

The query plan without the trigram index looks like this:

```
 Sort  (cost=3443312.34..3443339.28 rows=10779 width=83) (actual time=25818.498..25818.498 rows=5 loops=1)
   Sort Key: ci.id
   Sort Method: quicksort  Memory: 25kB
   Buffers: shared hit=9144 read=2442104
   ->  Nested Loop Left Join  (cost=1000.57..3442590.36 rows=10779 width=83) (actual time=26.659..25818.478 rows=5 loops=1)
         Buffers: shared hit=9144 read=2442104
         ->  Gather  (cost=1000.00..3397022.14 rows=10779 width=51) (actual time=26.596..25860.168 rows=5 loops=1)
               Workers Planned: 4
               Workers Launched: 4
               Buffers: shared hit=9119 read=2442104
               ->  Parallel Seq Scan on class_instance ci  (cost=0.00..3394944.24 rows=2695 width=51) (actual time=10386.978..25810.516 rows=1 loops=5)
                     Filter: ((class_id = ANY ('{3,6}'::integer[])) AND ((name)::text ~~* '%aSIP%'::text) AND (project_id = 1))
                     Rows Removed by Filter: 43141542
                     Buffers: shared hit=9119 read=2442104
         ->  Subquery Scan on skel_link  (cost=0.57..4.22 rows=1 width=36) (actual time=0.028..0.028 rows=0 loops=5)
               Filter: (ci.id = skel_link.id)
               Buffers: shared hit=25
               ->  GroupAggregate  (cost=0.57..4.21 rows=1 width=36) (actual time=0.024..0.025 rows=0 loops=5)
                     Group Key: cici_n.class_instance_b
                     Buffers: shared hit=25
                     ->  Index Scan using class_instance_class_instance_class_instance_b on class_instance_class_instance cici_n  (cost=0.57..4.19 rows=1 width=8) (actual time=0.016..0.016 rows=0 loops=5)
                           Index Cond: (class_instance_b = ci.id)
                           Filter: (relation_id = 10)
                           Rows Removed by Filter: 1
                           Buffers: shared hit=25
 Planning Time: 1.321 ms
 Execution Time: 25860.449 ms
```

The timing could be improved by making sure the whole table is in memory, but it won't change the sequential scan. And the query plan using the trigram index looks like this:

```
 Sort  (cost=84130.89..84157.84 rows=10779 width=83) (actual time=0.123..0.123 rows=5 loops=1)
   Sort Key: ci.id
   Sort Method: quicksort  Memory: 25kB
   Buffers: shared hit=33
   ->  Nested Loop Left Join  (cost=413.44..83408.92 rows=10779 width=83) (actual time=0.070..0.110 rows=5 loops=1)
         Buffers: shared hit=33
         ->  Bitmap Heap Scan on class_instance ci  (cost=412.88..37840.70 rows=10779 width=51) (actual time=0.041..0.053 rows=5 loops=1)
               Recheck Cond: ((name)::text ~~* '%aSIP%'::text)
               Filter: ((class_id = ANY ('{3,6}'::integer[])) AND (project_id = 1))
               Heap Blocks: exact=3
               Buffers: shared hit=8
               ->  Bitmap Index Scan on class_instance_name_trgm_idx  (cost=0.00..410.18 rows=21571 width=0) (actual time=0.030..0.030 rows=5 loops=1)
                     Index Cond: ((name)::text ~~* '%aSIP%'::text)
                     Buffers: shared hit=5
         ->  Subquery Scan on skel_link  (cost=0.57..4.22 rows=1 width=36) (actual time=0.010..0.010 rows=0 loops=5)
               Filter: (ci.id = skel_link.id)
               Buffers: shared hit=25
               ->  GroupAggregate  (cost=0.57..4.21 rows=1 width=36) (actual time=0.010..0.010 rows=0 loops=5)
                     Group Key: cici_n.class_instance_b
                     Buffers: shared hit=25
                     ->  Index Scan using class_instance_class_instance_class_instance_b on class_instance_class_instance cici_n  (cost=0.57..4.19 rows=1 width=8) (actual time=0.007..0.007 rows=0 loops=5)
                           Index Cond: (class_instance_b = ci.id)
                           Filter: (relation_id = 10)
                           Rows Removed by Filter: 1
                           Buffers: shared hit=25
 Planning Time: 1.362 ms
 Execution Time: 0.194 ms
```

No sequential scan or even parallel workers are needed anymore.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8f0d4bda99b2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.