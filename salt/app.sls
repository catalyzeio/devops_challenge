clone_python_app:
  git.latest:
    - name: https://github.com/catalyzeio/python-sample-app.git
    - target: /opt/python-sample-app

install_app_requirements:
  pip.installed:
    - requirements: /opt/python-sample-app/requirements.txt
    - require:
      - git: clone_python_app
      - sls: postgresql

app_script:
  file.managed:
    - name: /opt/sample-app.sh
    - source: salt://files/sample-app.sh
    - owner: root
    - group: root
    - mode: 755
    - template: jinja

app_supervisor_config:
  file.managed:
    - name: /etc/supervisor/conf.d/app.conf
    - source: salt://files/supervisor-app.conf
    - owner: root
    - group: root
    - mode: 644
    - template: jinja
    - require:
      - pkg: supervisor-package
      - pip: install_app_requirements
      - file: app_script

app_reload_supervisor:
  cmd.wait:
    - name: /usr/bin/supervisorctl reload
    - watch:
      - file: app_supervisor_config

