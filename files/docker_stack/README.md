# haproxy docker stack (haproxy / letsencrypt certbot / nginx_certbot)


* start to background
    ```
    make start
    ```

* stop
    ```
    make stop
    ```


### configuration

* stack config
    ```
    cp env_example env
    ```
    ```
    edit env
    ```

* haproxy config
    ```
    cp stack_data/haproxy_data/cfg/haproxy.cfg.example stack_data/haproxy_data/cfg/haproxy.cfg
    ```
    ```
    edit haproxy.cfg
    ```


* create self signed certificate
    ```
    make create_self_signed_cert
    ```


### create letsencrypt certificate
```
./renew_cert.sh
```

### renew cert crontab example
```
0 */12 * * * cd /home/user/haproxy_docker_stack/ && ./renew_cert.sh >/dev/null 2>&1
```


### (*) reset_stack.sh
    (!) removes all generated data files 
    (!) data loss
    (!) needs root privileges


### System Links

#### haproxy stats
```
http://172.17.0.1:8404/
```

