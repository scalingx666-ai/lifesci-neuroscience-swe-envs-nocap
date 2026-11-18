# Issue

**Title:** Fix linear detrend

## Description

Linear detrend in BrainFlow returns different result with [scipy.signal.detrend](https://docs.scipy.org/doc/scipy/reference/generated/scipy.signal.detrend.html).

SciPy:
```python
#!/usr/bin/env python3
# coding: utf-8

import numpy as np
from scipy.signal import detrend

t = np.arange(20)
print(t)
# [ 0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19]

y = np.sin(t)
print(y)
# [ 0.          0.84147098  0.90929743  0.14112001 -0.7568025  -0.95892427
#  -0.2794155   0.6569866   0.98935825  0.41211849 -0.54402111 -0.99999021
#  -0.53657292  0.42016704  0.99060736  0.65028784 -0.28790332 -0.96139749
#  -0.75098725  0.14987721]

y_with_trend = y + t

y_detrend = detrend(y_with_trend, type='linear')
print(y_detrend)
# [-0.23878509  0.62737234  0.71988523 -0.02360574 -0.89684179 -1.07427712
#  -0.3700819   0.59100665  0.94806474  0.39551143 -0.53594172 -0.96722437
#  -0.47912063  0.50230577  1.09743254  0.78179947 -0.13170523 -0.78051296
#  -0.54541627  0.38013464]

print(y_with_trend - y_detrend)
# Trend:
# [ 0.23878509  1.21409864  2.18941219  3.16472575  4.1400393   5.11535285
#   6.0906664   7.06597995  8.0412935   9.01660706  9.99192061 10.96723416
#  11.94254771 12.91786126 13.89317481 14.86848837 15.84380192 16.81911547
#  17.79442902 18.76974257]
```

BrainFlow:

```c
#include <math.h>
#include <stdio.h>
#include <stddef.h>


#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof(arr[0]))


void BrainFlowDetrendLinear(const double* data, int data_len, double* output)
{
    // use mean and gradient to find a line
    double mean_x = data_len / 2.0;
    double mean_y = 0;
    for (int i = 0; i < data_len; i++)
    {
        mean_y += data[i];
    }
    mean_y /= data_len;
    double temp_xy = 0.0;
    double temp_xx = 0.0;
    for (int i = 0; i < data_len; i++)
    {
        temp_xy += i * data[i];
        temp_xx += i * i;
    }
    double s_xy = temp_xy / data_len - mean_x * mean_y;
    double s_xx = temp_xx / data_len - mean_x * mean_x;
    double grad = s_xy / s_xx;
    double y_int = mean_y - grad * mean_x;
    for (int i = 0; i < data_len; i++)
    {
        output[i] = data[i] - (grad * i + y_int);
    }
}


void PrintArray(const double* x, size_t length)
{
    size_t i;

    putchar('[');
    
    if (length > 0)
    {
        printf("%f", x[0]);

        for (i = 1; i < length; ++i)
            printf(" %f", x[i]);
    }

    putchar(']');
    putchar('\n');
}


int main(void)
{
    double t[] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19 };
    double y[ARRAY_SIZE(t)];
    double y_with_trend[ARRAY_SIZE(y)];
    double y_detrend[ARRAY_SIZE(y)];
    double trend[ARRAY_SIZE(y)];
    size_t i;

    PrintArray(t, ARRAY_SIZE(t));

    for (i = 0; i < ARRAY_SIZE(t); ++i)
    {
        y[i] = sin(i);
        y_with_trend[i] = y[i] + i;
    }

    PrintArray(y, ARRAY_SIZE(y));

    BrainFlowDetrendLinear(
        y_with_trend, ARRAY_SIZE(y_with_trend), y_detrend);

    PrintArray(y_detrend, ARRAY_SIZE(y_detrend));

    for (i = 0; i < ARRAY_SIZE(y); ++i)
        trend[i] = y_with_trend[i] - y_detrend[i];

    PrintArray(trend, ARRAY_SIZE(trend));

    return 0;
}
```

Output:

```
[0.000000 1.000000 2.000000 3.000000 4.000000 5.000000 6.000000 7.000000 8.000000 9.000000 10.000000 11.000000 12.000000 13.000000 14.000000 15.000000 16.000000 17.000000 18.000000 19.000000]

[0.000000 0.841471 0.909297 0.141120 -0.756802 -0.958924 -0.279415 0.656987 0.989358 0.412118 -0.544021 -0.999990 -0.536573 0.420167 0.990607 0.650288 -0.287903 -0.961397 -0.750987 0.149877]

[2.273202 2.936926 2.827006 1.881082 0.805413 0.425545 0.927307 1.685962 1.840587 1.085601 -0.048285 -0.682001 -0.396330 0.382664 0.775357 0.257291 -0.858646 -1.709887 -1.677223 -0.954105]

[-2.273202 -1.095455 0.082292 1.260038 2.437785 3.615531 4.793278 5.971024 7.148771 8.326517 9.504264 10.682010 11.859757 13.037503 14.215250 15.392997 16.570743 17.748490 18.926236 20.103983]
```

With this patch, the output will be:

```
[0.000000 1.000000 2.000000 3.000000 4.000000 5.000000 6.000000 7.000000 8.000000 9.000000 10.000000 11.000000 12.000000 13.000000 14.000000 15.000000 16.000000 17.000000 18.000000 19.000000]

[0.000000 0.841471 0.909297 0.141120 -0.756802 -0.958924 -0.279415 0.656987 0.989358 0.412118 -0.544021 -0.999990 -0.536573 0.420167 0.990607 0.650288 -0.287903 -0.961397 -0.750987 0.149877]

[-0.238785 0.627372 0.719885 -0.023606 -0.896842 -1.074277 -0.370082 0.591007 0.948065 0.395511 -0.535942 -0.967224 -0.479121 0.502306 1.097433 0.781799 -0.131705 -0.780513 -0.545416 0.380135]

[0.238785 1.214099 2.189412 3.164726 4.140039 5.115353 6.090666 7.065980 8.041294 9.016607 9.991921 10.967234 11.942548 12.917861 13.893175 14.868488 15.843802 16.819115 17.794429 18.769743]
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bee49d3e1111`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.