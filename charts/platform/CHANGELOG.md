# Changelog

## [0.16.3](https://github.com/cloudquery/helm-charts/compare/platform-0.16.2...platform-0.16.3) (2025-03-25)


### Bug Fixes

* Adding external ID ([#741](https://github.com/cloudquery/helm-charts/issues/741)) ([c9ec1ec](https://github.com/cloudquery/helm-charts/commit/c9ec1ecb2e017d01d6375504a0c26cf91ea0dac0))

## [0.16.2](https://github.com/cloudquery/helm-charts/compare/platform-0.16.1...platform-0.16.2) (2025-03-25)


### Bug Fixes

* Force helm value to string ([#739](https://github.com/cloudquery/helm-charts/issues/739)) ([90438b4](https://github.com/cloudquery/helm-charts/commit/90438b4185a02f1a4ec999a80ec1185cebf4477d))

## [0.16.1](https://github.com/cloudquery/helm-charts/compare/platform-0.16.0...platform-0.16.1) (2025-03-25)


### Bug Fixes

* Change to string instead of boolean ([#737](https://github.com/cloudquery/helm-charts/issues/737)) ([1c569c6](https://github.com/cloudquery/helm-charts/commit/1c569c648f2ced5c291bb531df3face5e8ff5577))

## [0.16.0](https://github.com/cloudquery/helm-charts/compare/platform-0.15.0...platform-0.16.0) (2025-03-25)


### Features

* Adding S3 source environment variables ([#735](https://github.com/cloudquery/helm-charts/issues/735)) ([d41dcb3](https://github.com/cloudquery/helm-charts/commit/d41dcb3671804b7c483a4af53819b3101da38215))


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v1.1.0 ([#732](https://github.com/cloudquery/helm-charts/issues/732)) ([5e9ac36](https://github.com/cloudquery/helm-charts/commit/5e9ac36a9798646a0a5672da21df8537d2a8ae21))
* Set configmap variables correctly ([#736](https://github.com/cloudquery/helm-charts/issues/736)) ([d50e1bf](https://github.com/cloudquery/helm-charts/commit/d50e1bff831bb4ae33c0957ba2ac8c0b9acf2f7e))

## [0.15.0](https://github.com/cloudquery/helm-charts/compare/platform-0.14.0...platform-0.15.0) (2025-03-21)


### Features

* Adding S3 CSI ([#730](https://github.com/cloudquery/helm-charts/issues/730)) ([b32f8ce](https://github.com/cloudquery/helm-charts/commit/b32f8cea53b48a0b89073f7e4ecba643eff86f77))

## [0.14.0](https://github.com/cloudquery/helm-charts/compare/platform-0.13.6...platform-0.14.0) (2025-03-18)


### Features

* Add environment variables for analytics events ([#726](https://github.com/cloudquery/helm-charts/issues/726)) ([74b5a19](https://github.com/cloudquery/helm-charts/commit/74b5a196841893d251822a8e4f4fdd5c2ac8e83b))


### Bug Fixes

* Add liveness and readiness probes to otel-collector ([#724](https://github.com/cloudquery/helm-charts/issues/724)) ([d17180c](https://github.com/cloudquery/helm-charts/commit/d17180cf05805a466352922ddd00f0e78ee50fc4))
* Better handling of determining database existence ([#720](https://github.com/cloudquery/helm-charts/issues/720)) ([763911e](https://github.com/cloudquery/helm-charts/commit/763911e585b3d82ee8543fb8f9ecedfa8e45b6f3))

## [0.13.6](https://github.com/cloudquery/helm-charts/compare/platform-0.13.5...platform-0.13.6) (2025-03-05)


### Bug Fixes

* **deps:** Update otel/opentelemetry-collector-contrib Docker tag to v0.121.0 ([#718](https://github.com/cloudquery/helm-charts/issues/718)) ([4ebda1a](https://github.com/cloudquery/helm-charts/commit/4ebda1a2bd0f615f7b197554a5c3c5069cca13ec))

## [0.13.5](https://github.com/cloudquery/helm-charts/compare/platform-0.13.4...platform-0.13.5) (2025-03-05)


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v1.0.0 ([#715](https://github.com/cloudquery/helm-charts/issues/715)) ([8a6cf75](https://github.com/cloudquery/helm-charts/commit/8a6cf75841deb3f72df6d2ed08f1dbb6251b5d90))

## [0.13.4](https://github.com/cloudquery/helm-charts/compare/platform-0.13.3...platform-0.13.4) (2025-03-05)


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.87.1 ([#711](https://github.com/cloudquery/helm-charts/issues/711)) ([7b815e6](https://github.com/cloudquery/helm-charts/commit/7b815e68079201d341fec7c57e722e91d6b995c3))
* **deps:** Update dependency cloudquery/cloud to v0.87.2 ([#713](https://github.com/cloudquery/helm-charts/issues/713)) ([c112036](https://github.com/cloudquery/helm-charts/commit/c112036122ff78b10f7b22f899ba224d1886f506))

## [0.13.3](https://github.com/cloudquery/helm-charts/compare/platform-0.13.2...platform-0.13.3) (2025-03-04)


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.86.4 ([#706](https://github.com/cloudquery/helm-charts/issues/706)) ([34c3674](https://github.com/cloudquery/helm-charts/commit/34c3674b27d5bbc6f3cb0784e9971b0b816b4d2f))
* **deps:** Update dependency cloudquery/cloud to v0.87.0 ([#710](https://github.com/cloudquery/helm-charts/issues/710)) ([7416ac1](https://github.com/cloudquery/helm-charts/commit/7416ac1adc47f846be5bfb1c67649c3279d34ba3))

## [0.13.2](https://github.com/cloudquery/helm-charts/compare/platform-0.13.1...platform-0.13.2) (2025-03-03)


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.86.3 ([#703](https://github.com/cloudquery/helm-charts/issues/703)) ([ee7ad2e](https://github.com/cloudquery/helm-charts/commit/ee7ad2e5de07ad1758b31fc3740d0ad00c46d66c))

## [0.13.1](https://github.com/cloudquery/helm-charts/compare/platform-0.13.0...platform-0.13.1) (2025-03-03)


### Bug Fixes

* Manually update the otel config ([#701](https://github.com/cloudquery/helm-charts/issues/701)) ([e9f28da](https://github.com/cloudquery/helm-charts/commit/e9f28da8ebd432d417186ce7f0fe194c690f1c57))

## [0.13.0](https://github.com/cloudquery/helm-charts/compare/platform-0.12.12...platform-0.13.0) (2025-03-03)


### Features

* Add clustered clickhouse support ([#695](https://github.com/cloudquery/helm-charts/issues/695)) ([684fa2d](https://github.com/cloudquery/helm-charts/commit/684fa2da58159d513db3d33743d385bfc1077605))


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.86.1 ([#697](https://github.com/cloudquery/helm-charts/issues/697)) ([3cdfb76](https://github.com/cloudquery/helm-charts/commit/3cdfb76e3c3d5a3a4fb37a611115e3f3a5d71100))
* **deps:** Update dependency cloudquery/cloud to v0.86.2 ([#700](https://github.com/cloudquery/helm-charts/issues/700)) ([c950f20](https://github.com/cloudquery/helm-charts/commit/c950f20de3f4201602b2c0782d4e04681ce03d9b))

## [0.12.12](https://github.com/cloudquery/helm-charts/compare/platform-0.12.11...platform-0.12.12) (2025-03-01)


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.85.1 ([#693](https://github.com/cloudquery/helm-charts/issues/693)) ([77621e5](https://github.com/cloudquery/helm-charts/commit/77621e527f3338ef5172a5827f9189bd2d35c57b))

## [0.12.11](https://github.com/cloudquery/helm-charts/compare/platform-0.12.10...platform-0.12.11) (2025-03-01)


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.84.0 ([#688](https://github.com/cloudquery/helm-charts/issues/688)) ([a348644](https://github.com/cloudquery/helm-charts/commit/a348644802b910b694fb4cf5f3ba4585a03f74d3))
* **deps:** Update dependency cloudquery/cloud to v0.85.0 ([#692](https://github.com/cloudquery/helm-charts/issues/692)) ([0decde2](https://github.com/cloudquery/helm-charts/commit/0decde27a76315c6c2386aaccab1f261cd8c223b))
* **deps:** Update otel/opentelemetry-collector-contrib Docker tag to v0.120.0 ([#691](https://github.com/cloudquery/helm-charts/issues/691)) ([9a4adda](https://github.com/cloudquery/helm-charts/commit/9a4addac6359f25280fd21fb8f257f4616a33961))

## [0.12.10](https://github.com/cloudquery/helm-charts/compare/platform-0.12.9...platform-0.12.10) (2025-02-28)


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.83.0 ([#685](https://github.com/cloudquery/helm-charts/issues/685)) ([fb2c535](https://github.com/cloudquery/helm-charts/commit/fb2c535326d97ae0d1187ef8ccf3017b0a33a4a8))

## [0.12.9](https://github.com/cloudquery/helm-charts/compare/platform-0.12.8...platform-0.12.9) (2025-02-28)


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.82.0 ([#682](https://github.com/cloudquery/helm-charts/issues/682)) ([70efb64](https://github.com/cloudquery/helm-charts/commit/70efb6453de38dc65d5ac31569f6c7b1a8eee815))

## [0.12.8](https://github.com/cloudquery/helm-charts/compare/platform-0.12.7...platform-0.12.8) (2025-02-27)


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.81.0 ([#679](https://github.com/cloudquery/helm-charts/issues/679)) ([f9b4dab](https://github.com/cloudquery/helm-charts/commit/f9b4dab508b77cbb600a382777fbfb7e3e53b575))

## [0.12.7](https://github.com/cloudquery/helm-charts/compare/platform-0.12.6...platform-0.12.7) (2025-02-27)


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.80.0 ([#676](https://github.com/cloudquery/helm-charts/issues/676)) ([62b8727](https://github.com/cloudquery/helm-charts/commit/62b87271c9aa50adcc323952daa6cd21173f6a54))

## [0.12.6](https://github.com/cloudquery/helm-charts/compare/platform-0.12.5...platform-0.12.6) (2025-02-26)


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.79.1 ([#674](https://github.com/cloudquery/helm-charts/issues/674)) ([e213378](https://github.com/cloudquery/helm-charts/commit/e213378dfe43e71f18b1ac0677a64009512e5b0f))

## [0.12.5](https://github.com/cloudquery/helm-charts/compare/platform-0.12.4...platform-0.12.5) (2025-02-26)


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.79.0 ([#668](https://github.com/cloudquery/helm-charts/issues/668)) ([954e495](https://github.com/cloudquery/helm-charts/commit/954e4952e327fa1bdfbf5517095a914c8807abf3))

## [0.12.4](https://github.com/cloudquery/helm-charts/compare/platform-0.12.3...platform-0.12.4) (2025-02-26)


### Bug Fixes

* Allow otel collector to be configured ([#666](https://github.com/cloudquery/helm-charts/issues/666)) ([230677c](https://github.com/cloudquery/helm-charts/commit/230677c162ea19a497fb6ffcefc61087cf8f19fe))
* **deps:** Update dependency cloudquery/cloud to v0.77.0 ([#663](https://github.com/cloudquery/helm-charts/issues/663)) ([18c7db2](https://github.com/cloudquery/helm-charts/commit/18c7db2dc4322b30c30199507b5053d49864974e))

## [0.12.3](https://github.com/cloudquery/helm-charts/compare/platform-0.12.2...platform-0.12.3) (2025-02-25)


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.75.0 ([#659](https://github.com/cloudquery/helm-charts/issues/659)) ([59ed097](https://github.com/cloudquery/helm-charts/commit/59ed09750ab754ce86a20880ae978cbd35c6623a))
* **deps:** Update dependency cloudquery/cloud to v0.76.0 ([#662](https://github.com/cloudquery/helm-charts/issues/662)) ([ea70f50](https://github.com/cloudquery/helm-charts/commit/ea70f50f683b8ec1dd8cdcc5d400365132aa25b7))

## [0.12.2](https://github.com/cloudquery/helm-charts/compare/platform-0.12.1...platform-0.12.2) (2025-02-24)


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.74.0 ([#656](https://github.com/cloudquery/helm-charts/issues/656)) ([a482dc4](https://github.com/cloudquery/helm-charts/commit/a482dc40e18fc0720eeccb8c5d859f977b89f0b5))

## [0.12.1](https://github.com/cloudquery/helm-charts/compare/platform-0.12.0...platform-0.12.1) (2025-02-24)


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.73.0 ([#654](https://github.com/cloudquery/helm-charts/issues/654)) ([a2acc0b](https://github.com/cloudquery/helm-charts/commit/a2acc0b51af82bd4945b46c175fbbd08961e73e2))

## [0.12.0](https://github.com/cloudquery/helm-charts/compare/platform-0.11.4...platform-0.12.0) (2025-02-21)


### Features

* Add db check to init container and better output ([#640](https://github.com/cloudquery/helm-charts/issues/640)) ([c872890](https://github.com/cloudquery/helm-charts/commit/c8728906f08ed770c8cd03990680e10a70480728))


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.70.2 ([#646](https://github.com/cloudquery/helm-charts/issues/646)) ([9f36074](https://github.com/cloudquery/helm-charts/commit/9f3607406ec20b370d0152c2699fdc9cfef981e1))
* **deps:** Update dependency cloudquery/cloud to v0.71.0 ([#648](https://github.com/cloudquery/helm-charts/issues/648)) ([83bea98](https://github.com/cloudquery/helm-charts/commit/83bea982a320215829b2586117a51b1ba1dcba56))
* **deps:** Update dependency cloudquery/cloud to v0.72.0 ([#652](https://github.com/cloudquery/helm-charts/issues/652)) ([b97872e](https://github.com/cloudquery/helm-charts/commit/b97872e6559f592c6b687d72802516f5dcd9f0af))
* Handle the case when no port is supplied ([#650](https://github.com/cloudquery/helm-charts/issues/650)) ([43cec72](https://github.com/cloudquery/helm-charts/commit/43cec72b00a2fe8fa534a339e708b84f1852db90))
* Use a provided private key instead of generating one ([#651](https://github.com/cloudquery/helm-charts/issues/651)) ([0142ec0](https://github.com/cloudquery/helm-charts/commit/0142ec012da924d127b8bd1fdfe80e15c04c7e00))

## [0.11.4](https://github.com/cloudquery/helm-charts/compare/platform-0.11.3...platform-0.11.4) (2025-02-20)


### Bug Fixes

* Allow platform container to read logs from k8s API ([#635](https://github.com/cloudquery/helm-charts/issues/635)) ([450c6f3](https://github.com/cloudquery/helm-charts/commit/450c6f3a31c7db37601892f123388bdc7b700dd8))
* **deps:** Update dependency cloudquery/cloud to v0.69.1 ([#638](https://github.com/cloudquery/helm-charts/issues/638)) ([8afe314](https://github.com/cloudquery/helm-charts/commit/8afe314a1449f57e5d92642883bfcea254efa8dc))
* Revert RBAC changes from [#635](https://github.com/cloudquery/helm-charts/issues/635) ([#641](https://github.com/cloudquery/helm-charts/issues/641)) ([78678c2](https://github.com/cloudquery/helm-charts/commit/78678c23121405720113e7a0521f17df8d7d4bb8))

## [0.11.3](https://github.com/cloudquery/helm-charts/compare/platform-0.11.2...platform-0.11.3) (2025-02-19)


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.69.0 ([#636](https://github.com/cloudquery/helm-charts/issues/636)) ([116f2cb](https://github.com/cloudquery/helm-charts/commit/116f2cbfd56191eaaa5ac80d232a7795d626d229))

## [0.11.2](https://github.com/cloudquery/helm-charts/compare/platform-0.11.1...platform-0.11.2) (2025-02-19)


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.68.0 ([#634](https://github.com/cloudquery/helm-charts/issues/634)) ([36b1691](https://github.com/cloudquery/helm-charts/commit/36b16913c2392f59dc85b0f260521df141afaed7))
* Mirror all plugins by default ([#632](https://github.com/cloudquery/helm-charts/issues/632)) ([1ad7559](https://github.com/cloudquery/helm-charts/commit/1ad7559040eb31b6af6d72cec999645d1efa731f))
* Remove AES key file ([#630](https://github.com/cloudquery/helm-charts/issues/630)) ([5406757](https://github.com/cloudquery/helm-charts/commit/5406757feb63c5c2de7ba92dd1f5fef3321dda93))

## [0.11.1](https://github.com/cloudquery/helm-charts/compare/platform-0.11.0...platform-0.11.1) (2025-02-18)


### Bug Fixes

* Update `CQAPI_ASSETVIEW_INTERVAL` ([#627](https://github.com/cloudquery/helm-charts/issues/627)) ([886c2dd](https://github.com/cloudquery/helm-charts/commit/886c2dd985f696ca3e87f7b8504e292e9188f804))

## [0.11.0](https://github.com/cloudquery/helm-charts/compare/platform-0.10.0...platform-0.11.0) (2025-02-18)


### Features

* Adding pod disruption budget ([#625](https://github.com/cloudquery/helm-charts/issues/625)) ([c44e5ae](https://github.com/cloudquery/helm-charts/commit/c44e5ae0e3e13a6f52cfc9476eeff3936cd12ffe))


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.64.0 ([#622](https://github.com/cloudquery/helm-charts/issues/622)) ([cb9de60](https://github.com/cloudquery/helm-charts/commit/cb9de60e00726f3ee0ad8eb9df67ee658f6b064d))
* **deps:** Update dependency cloudquery/cloud to v0.65.0 ([#624](https://github.com/cloudquery/helm-charts/issues/624)) ([c925998](https://github.com/cloudquery/helm-charts/commit/c9259983a0982ec0457afd17f4aa62d7e22cb503))

## [0.10.0](https://github.com/cloudquery/helm-charts/compare/platform-0.9.2...platform-0.10.0) (2025-02-14)


### Features

* Add init container to check and create database if missing ([#612](https://github.com/cloudquery/helm-charts/issues/612)) ([57afbb3](https://github.com/cloudquery/helm-charts/commit/57afbb334a86edf7413a9d3aba3a23c199a79e5a))


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.60.0 ([#607](https://github.com/cloudquery/helm-charts/issues/607)) ([5f43576](https://github.com/cloudquery/helm-charts/commit/5f43576b434076adfc222a5bda6b7bf8daaa2894))
* **deps:** Update dependency cloudquery/cloud to v0.60.1 ([#609](https://github.com/cloudquery/helm-charts/issues/609)) ([0bbd9db](https://github.com/cloudquery/helm-charts/commit/0bbd9db8c5093660698d43dabd76333b4e16f326))
* **deps:** Update dependency cloudquery/cloud to v0.60.2 ([#610](https://github.com/cloudquery/helm-charts/issues/610)) ([2ad0a0d](https://github.com/cloudquery/helm-charts/commit/2ad0a0d46e308a12c0e1954bd51512d4fec5de88))
* **deps:** Update dependency cloudquery/cloud to v0.61.0 ([#613](https://github.com/cloudquery/helm-charts/issues/613)) ([1bf12b4](https://github.com/cloudquery/helm-charts/commit/1bf12b49caf38482e97b5f1d01ca086e9954705f))
* **deps:** Update dependency cloudquery/cloud to v0.62.0 ([#616](https://github.com/cloudquery/helm-charts/issues/616)) ([ac4b168](https://github.com/cloudquery/helm-charts/commit/ac4b168f9e2d368ba1bcb43b2d45ae6bcd25cf3c))
* **deps:** Update dependency cloudquery/cloud to v0.63.1 ([#618](https://github.com/cloudquery/helm-charts/issues/618)) ([9ed3cc2](https://github.com/cloudquery/helm-charts/commit/9ed3cc2f5f8ac0d631b7e0366ec574f3d06367f2))
* **deps:** Update dependency cloudquery/cloud to v0.63.2 ([#620](https://github.com/cloudquery/helm-charts/issues/620)) ([24c95d0](https://github.com/cloudquery/helm-charts/commit/24c95d0f9cc5e3177ced7e1fd5b0546000ee7fbf))
* **deps:** Update dependency cloudquery/cloud to v0.63.3 ([#621](https://github.com/cloudquery/helm-charts/issues/621)) ([d7d1ed3](https://github.com/cloudquery/helm-charts/commit/d7d1ed3798a4c89150fe4268e7e9d13669a9c903))

## [0.9.2](https://github.com/cloudquery/helm-charts/compare/platform-0.9.1...platform-0.9.2) (2025-02-07)


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.57.5 ([#599](https://github.com/cloudquery/helm-charts/issues/599)) ([64139bc](https://github.com/cloudquery/helm-charts/commit/64139bc5232a6f5483748fcf04fbc732be28e866))
* **deps:** Update dependency cloudquery/cloud to v0.58.0 ([#605](https://github.com/cloudquery/helm-charts/issues/605)) ([7c5a3cc](https://github.com/cloudquery/helm-charts/commit/7c5a3cc6fc5a20e3bd7327bb6e252fdaea643859))
* **deps:** Update dependency cloudquery/cloud to v0.58.1 ([#606](https://github.com/cloudquery/helm-charts/issues/606)) ([8bc2c31](https://github.com/cloudquery/helm-charts/commit/8bc2c31abb56a92276575ce0a3e9d64575bcf383))

## [0.9.1](https://github.com/cloudquery/helm-charts/compare/platform-0.9.0...platform-0.9.1) (2025-02-05)


### Bug Fixes

* Remove nginx configuration and add env variables ([#597](https://github.com/cloudquery/helm-charts/issues/597)) ([302bf6c](https://github.com/cloudquery/helm-charts/commit/302bf6c225e2925a0b24a1a7da726f9c57b2ba8b))

## [0.9.0](https://github.com/cloudquery/helm-charts/compare/platform-0.8.0...platform-0.9.0) (2025-02-04)


### Features

* Adding persistent volume ([#592](https://github.com/cloudquery/helm-charts/issues/592)) ([b56d962](https://github.com/cloudquery/helm-charts/commit/b56d96226ac7234dbf178a0c7963ad73739a693c))
* Support NLB deployment via Helm ([#583](https://github.com/cloudquery/helm-charts/issues/583)) ([e20d1ae](https://github.com/cloudquery/helm-charts/commit/e20d1aec9913b5724b64e08087bee433f8d4fccb))


### Bug Fixes

* Adding security context configuration ([#587](https://github.com/cloudquery/helm-charts/issues/587)) ([2f09eb4](https://github.com/cloudquery/helm-charts/commit/2f09eb434e1c761faf5a966f076f818b49bc524b))
* **deps:** Update dependency cloudquery/cloud to v0.51.0 ([#588](https://github.com/cloudquery/helm-charts/issues/588)) ([d5d060a](https://github.com/cloudquery/helm-charts/commit/d5d060a88d3b7597b1c6acd4f84b12501c577617))
* **deps:** Update dependency cloudquery/cloud to v0.51.1 ([#591](https://github.com/cloudquery/helm-charts/issues/591)) ([2f09b11](https://github.com/cloudquery/helm-charts/commit/2f09b1148ab5cebe27ed2f2f41610dc787a8a615))
* **deps:** Update dependency cloudquery/cloud to v0.52.0 ([#593](https://github.com/cloudquery/helm-charts/issues/593)) ([382aa97](https://github.com/cloudquery/helm-charts/commit/382aa97dbe79ae284c91c2d7e21298c694392dfd))
* **deps:** Update dependency cloudquery/cloud to v0.53.0 ([#596](https://github.com/cloudquery/helm-charts/issues/596)) ([61af827](https://github.com/cloudquery/helm-charts/commit/61af827ab2cdbe819ab69d6205511a638ce3da69))
* **deps:** Update otel/opentelemetry-collector-contrib Docker tag to v0.118.0 ([#590](https://github.com/cloudquery/helm-charts/issues/590)) ([d90da8b](https://github.com/cloudquery/helm-charts/commit/d90da8b4b47a9e8f95f765c83f3c1a1049d71f96))

## [0.8.0](https://github.com/cloudquery/helm-charts/compare/platform-0.7.3...platform-0.8.0) (2025-01-30)


### Features

* Add operator helm chart ([#584](https://github.com/cloudquery/helm-charts/issues/584)) ([807b4e8](https://github.com/cloudquery/helm-charts/commit/807b4e87a59fab416b098f4f079ea9f484fe4949))

## [0.7.3](https://github.com/cloudquery/helm-charts/compare/platform-0.7.2...platform-0.7.3) (2025-01-29)


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.50.0 ([#581](https://github.com/cloudquery/helm-charts/issues/581)) ([12e63aa](https://github.com/cloudquery/helm-charts/commit/12e63aa2ecadbcc1edb2e9dd4474534b6971f63e))

## [0.7.2](https://github.com/cloudquery/helm-charts/compare/platform-0.7.1...platform-0.7.2) (2025-01-29)


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.49.2 ([#579](https://github.com/cloudquery/helm-charts/issues/579)) ([c6dc363](https://github.com/cloudquery/helm-charts/commit/c6dc3631d11d85c50d461c847224cf2ac619e01f))

## [0.7.1](https://github.com/cloudquery/helm-charts/compare/platform-0.7.0...platform-0.7.1) (2025-01-28)


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.45.1 ([#568](https://github.com/cloudquery/helm-charts/issues/568)) ([68307a6](https://github.com/cloudquery/helm-charts/commit/68307a6a5745653396be3f0e90718ba94eeae653))
* **deps:** Update dependency cloudquery/cloud to v0.46.0 ([#570](https://github.com/cloudquery/helm-charts/issues/570)) ([412761a](https://github.com/cloudquery/helm-charts/commit/412761acf0c0a3649a826facafcb6f5211f3e07a))
* **deps:** Update dependency cloudquery/cloud to v0.47.0 ([#571](https://github.com/cloudquery/helm-charts/issues/571)) ([9638ad1](https://github.com/cloudquery/helm-charts/commit/9638ad1ab1e72ae58802638bd62ccd3da643bf82))
* **deps:** Update dependency cloudquery/cloud to v0.47.1 ([#572](https://github.com/cloudquery/helm-charts/issues/572)) ([6dfa2ef](https://github.com/cloudquery/helm-charts/commit/6dfa2ef69fe89de9d6513d88da5569eb84e21d08))
* **deps:** Update dependency cloudquery/cloud to v0.47.2 ([#573](https://github.com/cloudquery/helm-charts/issues/573)) ([63ffc5d](https://github.com/cloudquery/helm-charts/commit/63ffc5d975916a196dde0fe67751c3e266dbb62f))
* **deps:** Update dependency cloudquery/cloud to v0.48.0 ([#574](https://github.com/cloudquery/helm-charts/issues/574)) ([6b8853e](https://github.com/cloudquery/helm-charts/commit/6b8853e5ebece573a680b6b0563938e7cf25ac8e))
* **deps:** Update dependency cloudquery/cloud to v0.49.0 ([#575](https://github.com/cloudquery/helm-charts/issues/575)) ([10c7182](https://github.com/cloudquery/helm-charts/commit/10c7182c1d9a6c521eac0b480c587c506376734b))
* **deps:** Update dependency cloudquery/cloud to v0.49.1 ([#576](https://github.com/cloudquery/helm-charts/issues/576)) ([7934b48](https://github.com/cloudquery/helm-charts/commit/7934b48b0267059457b1aea39a067985dda28259))

## [0.7.0](https://github.com/cloudquery/helm-charts/compare/platform-0.6.2...platform-0.7.0) (2025-01-23)


### Features

* Add initial support for the scheduler ([#564](https://github.com/cloudquery/helm-charts/issues/564)) ([ea6c1aa](https://github.com/cloudquery/helm-charts/commit/ea6c1aa2199abff18d910c3ddc85f1240212774b))


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.42.0 ([#561](https://github.com/cloudquery/helm-charts/issues/561)) ([2b7f95d](https://github.com/cloudquery/helm-charts/commit/2b7f95d73e5e35147c339025ff33023189c0b524))
* **deps:** Update dependency cloudquery/cloud to v0.43.0 ([#563](https://github.com/cloudquery/helm-charts/issues/563)) ([d132d9d](https://github.com/cloudquery/helm-charts/commit/d132d9d7dbc28b4d4bde9e86428833965d480089))
* **deps:** Update dependency cloudquery/cloud to v0.44.0 ([#565](https://github.com/cloudquery/helm-charts/issues/565)) ([9734f47](https://github.com/cloudquery/helm-charts/commit/9734f475fc38d04412b88d4f3a902b945d6ce8ba))
* **deps:** Update dependency cloudquery/cloud to v0.45.0 ([#566](https://github.com/cloudquery/helm-charts/issues/566)) ([e7604a1](https://github.com/cloudquery/helm-charts/commit/e7604a1be511f8ddb408e8234cf0fb734ed243d3))

## [0.6.2](https://github.com/cloudquery/helm-charts/compare/platform-0.6.1...platform-0.6.2) (2025-01-20)


### Bug Fixes

* Cleanup extra env variable ([#558](https://github.com/cloudquery/helm-charts/issues/558)) ([2bcd728](https://github.com/cloudquery/helm-charts/commit/2bcd728b4da5851730ff477541238f61dbb329b8))
* **deps:** Update dependency cloudquery/cloud to v0.40.0 ([#556](https://github.com/cloudquery/helm-charts/issues/556)) ([12446b7](https://github.com/cloudquery/helm-charts/commit/12446b7359f59d543372b91934ef6193c65e2606))
* **deps:** Update dependency cloudquery/cloud to v0.41.0 ([#560](https://github.com/cloudquery/helm-charts/issues/560)) ([737edcb](https://github.com/cloudquery/helm-charts/commit/737edcbe32ae15f6016480402ef3d26dbfb40343))
* Make otel DB configurable ([#559](https://github.com/cloudquery/helm-charts/issues/559)) ([5d6398a](https://github.com/cloudquery/helm-charts/commit/5d6398a5118193666a9984b9f9dcd294c5c263e9))

## [0.6.1](https://github.com/cloudquery/helm-charts/compare/platform-0.6.0...platform-0.6.1) (2025-01-20)


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.39.2 ([#552](https://github.com/cloudquery/helm-charts/issues/552)) ([b9aaa3a](https://github.com/cloudquery/helm-charts/commit/b9aaa3abc49c1b1e793d4ccf42bd03176a076121))

## [0.6.0](https://github.com/cloudquery/helm-charts/compare/platform-0.5.2...platform-0.6.0) (2025-01-20)


### Features

* Adding OTEL collector to Helm Chart ([#549](https://github.com/cloudquery/helm-charts/issues/549)) ([0b5660c](https://github.com/cloudquery/helm-charts/commit/0b5660cc7772466f476c5c66382f84ac739478fa))


### Bug Fixes

* Add CLICKHOUSE_DATABASE back to config ([#554](https://github.com/cloudquery/helm-charts/issues/554)) ([93a89ab](https://github.com/cloudquery/helm-charts/commit/93a89abe54180eacf05cd629bcdb5f1ea830929d))
* **deps:** Update dependency cloudquery/cloud to v0.39.0 ([#548](https://github.com/cloudquery/helm-charts/issues/548)) ([5b65cce](https://github.com/cloudquery/helm-charts/commit/5b65cce624107465ffbf5b1b90400ba3083f6a1c))
* **deps:** Update dependency cloudquery/cloud to v0.39.1 ([#551](https://github.com/cloudquery/helm-charts/issues/551)) ([931c776](https://github.com/cloudquery/helm-charts/commit/931c776ad0d76263afc207507060cf45da16f678))

## [0.5.2](https://github.com/cloudquery/helm-charts/compare/platform-0.5.1...platform-0.5.2) (2025-01-16)


### Bug Fixes

* Default to `localhost` if no host is specified ([#546](https://github.com/cloudquery/helm-charts/issues/546)) ([e2a8a2f](https://github.com/cloudquery/helm-charts/commit/e2a8a2fff394430b65c86442f20c9a2572d979ca))
* **deps:** Update dependency cloudquery/cloud to v0.30.0 ([#535](https://github.com/cloudquery/helm-charts/issues/535)) ([11703d4](https://github.com/cloudquery/helm-charts/commit/11703d4f0b0b91c5bcb5690650efb0c03fe789a6))
* **deps:** Update dependency cloudquery/cloud to v0.31.0 ([#537](https://github.com/cloudquery/helm-charts/issues/537)) ([d021c11](https://github.com/cloudquery/helm-charts/commit/d021c11ac9f754a2e84d4c48cadcf24c893ae92c))
* **deps:** Update dependency cloudquery/cloud to v0.32.0 ([#538](https://github.com/cloudquery/helm-charts/issues/538)) ([77605f3](https://github.com/cloudquery/helm-charts/commit/77605f324ba4eb0c5a0cf4da72125a67f9890ca9))
* **deps:** Update dependency cloudquery/cloud to v0.34.0 ([#539](https://github.com/cloudquery/helm-charts/issues/539)) ([1df9f6b](https://github.com/cloudquery/helm-charts/commit/1df9f6b1bf5cc7302c1a9a240ac557f7cf79e1b2))
* **deps:** Update dependency cloudquery/cloud to v0.35.0 ([#540](https://github.com/cloudquery/helm-charts/issues/540)) ([e0ca11a](https://github.com/cloudquery/helm-charts/commit/e0ca11a6af25365e9789980a8dee4bca04a2cb31))
* **deps:** Update dependency cloudquery/cloud to v0.36.0 ([#541](https://github.com/cloudquery/helm-charts/issues/541)) ([0398947](https://github.com/cloudquery/helm-charts/commit/0398947a422bb7fc2e2fc11fdf81955e63e54709))
* **deps:** Update dependency cloudquery/cloud to v0.37.0 ([#542](https://github.com/cloudquery/helm-charts/issues/542)) ([9dd606f](https://github.com/cloudquery/helm-charts/commit/9dd606fd75e3367c34c7c8921d4522fc36df5662))
* **deps:** Update dependency cloudquery/cloud to v0.37.1 ([#543](https://github.com/cloudquery/helm-charts/issues/543)) ([13e8933](https://github.com/cloudquery/helm-charts/commit/13e8933a1ca27fa0a49e9d49b5f7fbc887a6a570))
* **deps:** Update dependency cloudquery/cloud to v0.37.2 ([#544](https://github.com/cloudquery/helm-charts/issues/544)) ([2bde6c4](https://github.com/cloudquery/helm-charts/commit/2bde6c4629f1751a1f921609c96fdd8c49867cde))
* **deps:** Update dependency cloudquery/cloud to v0.37.3 ([#545](https://github.com/cloudquery/helm-charts/issues/545)) ([f310573](https://github.com/cloudquery/helm-charts/commit/f310573fedcf1b68fa95b32dbaa551b56b93f247))
* **deps:** Update dependency cloudquery/cloud to v0.38.0 ([#547](https://github.com/cloudquery/helm-charts/issues/547)) ([e96e0ef](https://github.com/cloudquery/helm-charts/commit/e96e0ef7d9acb92b3f44e8f35dfba2849b4dca1e))

## [0.5.1](https://github.com/cloudquery/helm-charts/compare/platform-0.5.0...platform-0.5.1) (2025-01-07)


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.29.0 ([#531](https://github.com/cloudquery/helm-charts/issues/531)) ([148fb11](https://github.com/cloudquery/helm-charts/commit/148fb114b047cdfd154332cd8a3f40dbd7f9ec97))

## [0.5.0](https://github.com/cloudquery/helm-charts/compare/platform-0.4.0...platform-0.5.0) (2025-01-03)


### Features

* Allow deployment to EKS ([#528](https://github.com/cloudquery/helm-charts/issues/528)) ([59d1a35](https://github.com/cloudquery/helm-charts/commit/59d1a354ed57fa518a0d7a70c8130180fec26ea0))


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.28.1 ([#527](https://github.com/cloudquery/helm-charts/issues/527)) ([d6bc844](https://github.com/cloudquery/helm-charts/commit/d6bc84485d71d9794804ce0383be2369e65c8437))
* Use a shared volume for the `CQAPI_LOCAL_AES_KEY_FILE` ([#529](https://github.com/cloudquery/helm-charts/issues/529)) ([e743add](https://github.com/cloudquery/helm-charts/commit/e743addd5d6ef181d107ae84ab30f3361730c9fb))

## [0.4.0](https://github.com/cloudquery/helm-charts/compare/platform-0.3.1...platform-0.4.0) (2024-12-18)


### Features

* Remove redis from Chart ([#525](https://github.com/cloudquery/helm-charts/issues/525)) ([0af38e6](https://github.com/cloudquery/helm-charts/commit/0af38e6043686c2670476a24ba4c7917319eef25))

## [0.3.1](https://github.com/cloudquery/helm-charts/compare/platform-0.3.0...platform-0.3.1) (2024-12-18)


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.25.0 ([#521](https://github.com/cloudquery/helm-charts/issues/521)) ([a634a7b](https://github.com/cloudquery/helm-charts/commit/a634a7b34bd061bed410c2b5c8abaf61134094fb))
* **deps:** Update dependency cloudquery/cloud to v0.25.1 ([#523](https://github.com/cloudquery/helm-charts/issues/523)) ([cb54e9f](https://github.com/cloudquery/helm-charts/commit/cb54e9fe9f19f004f8e25b2fb237afd6fe166574))
* **deps:** Update dependency cloudquery/cloud to v0.26.0 ([#524](https://github.com/cloudquery/helm-charts/issues/524)) ([2a82480](https://github.com/cloudquery/helm-charts/commit/2a82480a1ec68f89538aaca5ad7b83bd9d43a2e5))

## [0.3.0](https://github.com/cloudquery/helm-charts/compare/platform-0.2.3...platform-0.3.0) (2024-12-17)


### ⚠ BREAKING CHANGES

* Update cloud dependency to `v0.23.0` ([#518](https://github.com/cloudquery/helm-charts/issues/518))

### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.22.0 ([#515](https://github.com/cloudquery/helm-charts/issues/515)) ([0b147f7](https://github.com/cloudquery/helm-charts/commit/0b147f704d3c0a1b4d330ea45f886e976407fbb0))
* Update cloud dependency to `v0.23.0` ([#518](https://github.com/cloudquery/helm-charts/issues/518)) ([2ccb6a0](https://github.com/cloudquery/helm-charts/commit/2ccb6a087e48c5a81db574993cbaa081e59272d2))


### Miscellaneous Chores

* Fix release to 0.3.0 ([#520](https://github.com/cloudquery/helm-charts/issues/520)) ([ef7fa16](https://github.com/cloudquery/helm-charts/commit/ef7fa169e661dabe0b2fc7be2af37f46dcbf9bfd))

## [0.2.3](https://github.com/cloudquery/helm-charts/compare/platform-0.2.2...platform-0.2.3) (2024-12-12)


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.16.0 ([#506](https://github.com/cloudquery/helm-charts/issues/506)) ([14d8c98](https://github.com/cloudquery/helm-charts/commit/14d8c98060c7d1f0034d7ac4d2ff67f6ae33a835))
* **deps:** Update dependency cloudquery/cloud to v0.17.0 ([#508](https://github.com/cloudquery/helm-charts/issues/508)) ([a7aa06a](https://github.com/cloudquery/helm-charts/commit/a7aa06a03d296eb3aec071d20c131bd1c0292693))
* **deps:** Update dependency cloudquery/cloud to v0.18.0 ([#509](https://github.com/cloudquery/helm-charts/issues/509)) ([013c569](https://github.com/cloudquery/helm-charts/commit/013c569bb829a86f40acffa71b9cb33c425c54b5))
* **deps:** Update dependency cloudquery/cloud to v0.19.0 ([#510](https://github.com/cloudquery/helm-charts/issues/510)) ([48f49cc](https://github.com/cloudquery/helm-charts/commit/48f49cc548db4ffc6f40a1ead9a9bca9598f7f8c))
* **deps:** Update dependency cloudquery/cloud to v0.20.0 ([#511](https://github.com/cloudquery/helm-charts/issues/511)) ([14999c3](https://github.com/cloudquery/helm-charts/commit/14999c34ff3b6b730f640002f1542a9417228709))
* **deps:** Update dependency cloudquery/cloud to v0.21.0 ([#513](https://github.com/cloudquery/helm-charts/issues/513)) ([0168df4](https://github.com/cloudquery/helm-charts/commit/0168df4550fc146ef5d5a285a3e6225b2d278138))
* **deps:** Update dependency cloudquery/cloud to v0.21.1 ([#514](https://github.com/cloudquery/helm-charts/issues/514)) ([17b19d9](https://github.com/cloudquery/helm-charts/commit/17b19d9cc5c655c528e760b5aae5e386b2bbe583))

## [0.2.2](https://github.com/cloudquery/helm-charts/compare/platform-0.2.1...platform-0.2.2) (2024-12-06)


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.15.2 ([#496](https://github.com/cloudquery/helm-charts/issues/496)) ([8798e40](https://github.com/cloudquery/helm-charts/commit/8798e40a90cb23b555b5b848b58b248c4462f89b))
* **deps:** Update dependency cloudquery/cloud to v0.15.3 ([#498](https://github.com/cloudquery/helm-charts/issues/498)) ([ed1b06e](https://github.com/cloudquery/helm-charts/commit/ed1b06e718edd78c97359ebf78dd327e43e56e3b))
* **deps:** Update dependency cloudquery/cloud to v0.15.4 ([#499](https://github.com/cloudquery/helm-charts/issues/499)) ([e5a7d3a](https://github.com/cloudquery/helm-charts/commit/e5a7d3aabad7b2c096a4b9a07ab65eaada3f41b4))

## [0.2.1](https://github.com/cloudquery/helm-charts/compare/platform-0.2.0...platform-0.2.1) (2024-12-05)


### Bug Fixes

* **deps:** Update appVersion to 0.15.1 ([08a0a8c](https://github.com/cloudquery/helm-charts/commit/08a0a8cba9fddd890b24f085c31207a77043680b))
* **deps:** Update dependency cloudquery/cloud to v0.15.1 ([#487](https://github.com/cloudquery/helm-charts/issues/487)) ([78be85a](https://github.com/cloudquery/helm-charts/commit/78be85a1b30ae3a66b594edeeb8e09bbac18da98))

## [0.2.0](https://github.com/cloudquery/helm-charts/compare/platform-0.1.2...platform-0.2.0) (2024-12-05)


### Features

* Adding platform ingress ([#476](https://github.com/cloudquery/helm-charts/issues/476)) ([73c8061](https://github.com/cloudquery/helm-charts/commit/73c80617ad2603475f552f7def5ef6ac2db0f8b3))

## [0.1.2](https://github.com/cloudquery/helm-charts/compare/platform-v0.1.1...platform-0.1.2) (2024-12-04)


### Features

* Adding initial platform helm chart ([dfca4e1](https://github.com/cloudquery/helm-charts/commit/dfca4e1573a69b8cd6030878f52917cd69048c9f))


### Bug Fixes

* **deps:** Update dependency cloudquery/cloud to v0.14.0 ([#454](https://github.com/cloudquery/helm-charts/issues/454)) ([59b6bca](https://github.com/cloudquery/helm-charts/commit/59b6bca5ea28c2014d552bc6f514714b13fc3a80))
* **deps:** Update dependency cloudquery/cloud to v0.14.2 ([#474](https://github.com/cloudquery/helm-charts/issues/474)) ([3c5094b](https://github.com/cloudquery/helm-charts/commit/3c5094becfe4b9706e32009603729039839950f7))
