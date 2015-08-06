postgresql-package:
  pkg.installed:
    - name: postgresql

postgresql-dev:
  pkg.installed:
    - name: postgresql-server-dev-all

catalyze_dev_user:
  postgres_user.present:
    - name: 'catalyze_dev'
    - password: 'catalyze_dev'
    - require:
      - pkg: postgresql-package
      - pkg: postgresql-dev

catalyze_dev_database:
  postgres_database.present:
    - name: 'catalyze_dev'
    - owner: 'catalyze_dev'
    - require:
      - postgres_user: catalyze_dev_user
