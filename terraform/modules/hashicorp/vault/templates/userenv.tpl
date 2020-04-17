export CONSUL_CACERT=${ca_file}
export CONSUL_CAPATH=${ca_path}
export CONSUL_CLIENT_CERT=${cert_file}
export CONSUL_CLIENT_KEY=${key_file}
export CONSUL_HTTP_ADDR=https://client.ari.consul:8501
export CONSUL_HTTP_SSL=true
export CONSUL_TLS_SERVER_NAME=client.ari.consul