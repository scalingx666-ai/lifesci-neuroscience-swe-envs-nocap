# Issue

**Title:** Fix/integration awareness oauth guard

## Description

This pull request introduces improvements for Azure AI Foundry support, clarifies model selection UI, and enhances provider configuration for Anthropic and Azure endpoints. The main changes include distinguishing Azure endpoint types in the Anthropic provider, updating request handling and caching logic, and improving the model selection and provider form UX.

### Azure/Anthropic provider enhancements

* Added `is_azure` and improved `is_azure_openai` flags in `AnthropicProvider`, enabling correct handling of Azure-hosted endpoints and distinguishing between classic Azure OpenAI and Azure AI Foundry. [[1]](diffhunk://#diff-305dee52837b982d53859edbf4b3c685ac0f9ad16bbaa7f0a3ed16072a82637cL34-R38) [[2]](diffhunk://#diff-305dee52837b982d53859edbf4b3c685ac0f9ad16bbaa7f0a3ed16072a82637cL45-R57)
* Updated request URL construction and authentication logic to support Azure AI Foundry's native Anthropic proxy, ensuring correct query parameters and headers for each Azure endpoint type. [[1]](diffhunk://#diff-305dee52837b982d53859edbf4b3c685ac0f9ad16bbaa7f0a3ed16072a82637cL414-R451) [[2]](diffhunk://#diff-305dee52837b982d53859edbf4b3c685ac0f9ad16bbaa7f0a3ed16072a82637cL523-R569)
* Refined prompt caching and system/tool formatting: classic Azure OpenAI skips prompt caching and uses plain text, while Azure AI Foundry supports Anthropic's native features. [[1]](diffhunk://#diff-305dee52837b982d53859edbf4b3c685ac0f9ad16bbaa7f0a3ed16072a82637cR469-R475) [[2]](diffhunk://#diff-305dee52837b982d53859edbf4b3c685ac0f9ad16bbaa7f0a3ed16072a82637cR484-R497)

### Provider selection and configuration UX

* Improved `populateModelSelect` to allow hiding Ollama (local-only) providers and provider group labels, supporting a flat model list UI; applied these options in mini-hub and main model selection. [[1]](diffhunk://#diff-2930d530fd8acfec6b2a908ed8a277068c35e6dfa0e37ddf7614eb6a4a99bfd2R101-R113) [[2]](diffhunk://#diff-2930d530fd8acfec6b2a908ed8a277068c35e6dfa0e37ddf7614eb6a4a99bfd2L120-R147) [[3]](diffhunk://#diff-2930d530fd8acfec6b2a908ed8a277068c35e6dfa0e37ddf7614eb6a4a99bfd2R156) [[4]](diffhunk://#diff-9594659f542878ff7c33402aa5276b8dd6e7bd41ba48462f776c8fecb68c0308R460-R461) [[5]](diffhunk://#diff-4fab5baaca5c14d2de62d8d2fceef376ddddcc8e9509d86cfa5643f51b89ce3dR126-R127)
* Enhanced Azure Foundry provider form: updated placeholders and instructions for Target URI and model ID, and auto-syncs model name from ID for streamlined setup. [[1]](diffhunk://#diff-62c50971f5dd18c8d66797f9aba76fa863a7889031d49e3e7799468c1e46f4ccL525-R538) [[2]](diffhunk://#diff-62c50971f5dd18c8d66797f9aba76fa863a7889031d49e3e7799468c1e46f4ccR548-R554)

### Provider routing logic

* Modified provider instantiation to route AzureFoundry providers with `/anthropic` in the Target URI to `AnthropicProvider`, ensuring correct wire protocol and API usage.

### Validation improvements

* Updated provider ID validation to accept dots and numbers as valid characters and clarified error messaging.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `69fc16ddf568`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.