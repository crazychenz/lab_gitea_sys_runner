# Create a state folder for our runner
sudo chown cicd /opt/state
mkdir -p /opt/state/gitea_sys_runner/data
# Generate a clean act_runner configuration
docker compose run --entrypoint "act_runner" gitea_sys_runner generate-config \
  > /opt/state/gitea_sys_runner/data/config.yaml
# Fetch registration token
docker compose exec -u 1000 gitea_svc \
  gitea --config /data/gitea/conf/app.ini actions generate-runner-token