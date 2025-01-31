#!bin/bash
echo "Running Container Image Security Checks..."
docker images 
trivy image a6a77683d370 
docker run -it --net host --pid host --userns host --cap-add audit_control \
-v /etc:/etc:ro \
-v /usr/bin/containerd:/usr/bin/containerd:ro \
-v /usr/bin/runc:/usr/bin/runc:ro \
-v /usr/lib/systemd:/usr/lib/systemd:ro \
-v /var/lib:/var/lib:ro \
-v /var/run/docker.sock:/var/run/docker.sock:ro \
--label docker_bench_security \
custom-docker-bench-security

