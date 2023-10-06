alias runlike="docker pull -q assaflavie/runlike && docker image prune -f && docker run --rm -v /var/run/docker.sock:/var/run/docker.sock assaflavie/runlike"
. "/root/.acme.sh/acme.sh.env"
