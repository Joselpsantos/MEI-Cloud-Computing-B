# Cloud-Computing-B
Repositório para a solução da parte B do projeto final de cloud computing

===

## Papar Information
- Title:  `paper name`
- Authors:  `Rui Paiva`,`José Santos`
- Preprint: [https://arxiv.org/abs/xx]()
- Full-preprint: [paper position]()
- Video: [video position]()

## Install & Dependence
- python
- pytorch
- numpy

## Dataset Preparation
| Dataset | Download |
| ---     | ---   |
| dataset-A | [download]() |
| dataset-B | [download]() |
| dataset-C | [download]() |

## Use
- for train
  ```
  python train.py
  ```
- for test
  ```
  python test.py
  ```
## Pretrained model
| Model | Download |
| ---     | ---   |
| Model-1 | [download]() |
| Model-2 | [download]() |
| Model-3 | [download]() |


## Directory Hierarchy
```
|—— .env
|—— .env.sample
|—— .gitignore
|—— data
|    |—— pgadmin
|        |—— azurecredentialcache
|        |—— pgadmin4.db
|        |—— sessions
|            |—— 2e9dcfa7-4b0d-4a28-aed7-ad741ce181d9
|            |—— 729e0f8a-e88a-4b70-beb8-a4012c559b3c
|        |—— storage
|    |—— postgres1
|        |—— base|             
|        |—— global
|        |—— pg_commit_ts
|        |—— pg_dynshmem
|        |—— pg_hba.conf
|        |—— pg_ident.conf
|        |—— pg_logical
|            |—— mappings
|            |—— replorigin_checkpoint
|            |—— snapshots
|        |—— pg_multixact
|            |—— members
|                |—— 0000
|            |—— offsets
|                |—— 0000
|        |—— pg_notify
|        |—— pg_replslot
|        |—— pg_serial
|        |—— pg_snapshots
|        |—— pg_stat
|        |—— pg_stat_tmp
|        |—— pg_subtrans
|            |—— 0000
|        |—— pg_tblspc
|        |—— pg_twophase
|        |—— PG_VERSION
|        |—— pg_wal
|            |—— 000000010000000000000001
|            |—— archive_status
|        |—— pg_xact
|            |—— 0000
|        |—— postgresql.auto.conf
|        |—— postgresql.conf
|        |—— postmaster.opts
|        |—— postmaster.pid
|    |—— postgres2
|        |—— base|              
|        |—— global
|        |—— pg_commit_ts
|        |—— pg_dynshmem
|        |—— pg_hba.conf
|        |—— pg_ident.conf
|        |—— pg_logical
|            |—— mappings
|            |—— replorigin_checkpoint
|            |—— snapshots
|        |—— pg_multixact
|            |—— members
|                |—— 0000
|            |—— offsets
|                |—— 0000
|        |—— pg_notify
|        |—— pg_replslot
|        |—— pg_serial
|        |—— pg_snapshots
|        |—— pg_stat
|        |—— pg_stat_tmp
|        |—— pg_subtrans
|            |—— 0000
|        |—— pg_tblspc
|        |—— pg_twophase
|        |—— PG_VERSION
|        |—— pg_wal
|            |—— 000000010000000000000001
|            |—— archive_status
|        |—— pg_xact
|            |—— 0000
|        |—— postgresql.auto.conf
|        |—— postgresql.conf
|        |—— postmaster.opts
|        |—— postmaster.pid
|—— docker-compose.yml
|—— nginx
|    |—— Dockerfile
|    |—— nginx.conf
|—— pgbouncer
|    |—— consul-template-pgbouncer.conf
|    |—— Dockerfile
|    |—— entrypoint.sh
|    |—— pgbouncer.ini
|—— postgres
|    |—— consul-template-postgres.conf
|    |—— Dockerfile
|—— provision
|    |—— install_consul.sh
|    |—— install_pgAdmin.sh
```
## Code Details
### Tested Platform
- software
  ```
  OS: Debian unstable (May 2021), Ubuntu LTS
  Python: 3.8.5 (anaconda)
  PyTorch: 1.7.1, 1.8.1
  ```
- hardware
  ```
  CPU: Intel Xeon 6226R
  GPU: Nvidia RTX3090 (24GB)
  ```
### Hyper parameters
```
```
## References
- [paper-1]()
- [paper-2]()
- [code-1](https://github.com)
- [code-2](https://github.com)
  