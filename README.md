# ansible role - haproxy docker stack (haproxy / letsencrypt certbot)


#### hosts.yml - inventory example
```
---

haproxy:
  hosts:
    host1.example:
```

#### haproxy.yml - playbook example
```
---

- name: Deploy haproxy

  hosts: haproxy

  gather_facts: false

  roles:
    - haproxy

  vars:

    ansible_user: example_user

    docker_user: example_user

    haproxy_docker_stack_directory: "/home/example_user/docker_stacks/haproxy_docker_stack"

    haproxy_network_subnet: "172.17.0.0/24"
    haproxy_network_gateway: "172.17.0.1"

    haproxy_http_port: 80
    haproxy_https_port: 443
    haproxy_stats_port: 8404

    certbot_domain: "sub1.example.com,sub2.example.com"
    certbot_email: "example@my_email.com"
    #certbot_options: "--staging"
    certbot_options: ""

    http_backends:
      - {
          name: "haproxy",
          url_path: "haproxy.example.lan",
          servers: "server server1 172.17.0.1:8404 check\n  server server2 172.17.0.1:8404 check"
        }

    https_backends:
      - {
          name: "ssl_haproxy",
          url_path: "ssl_haproxy.example.lan",
          servers: "server server1 172.17.0.1:8404 check"
        }
```