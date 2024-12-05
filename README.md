# Cloudflare Turnstile on .onion sites


## Setup

You need to have a Cloudflare account but you don't need to have a normal domain. 

Docker is required to run the server.

To generate an onion domain, run `./scripts/generate_onion.sh` with sudo:

```bash
sudo bash ./scripts/generate_onion.sh
```

The `hostname` and key files will be generated in the `./tor/hidden_service` directory. You can check the onion domain to be used **in the `hostname` file**.

## Serve

Run

```bash
# uncomment the -d flag to run in the background
docker compose up # -d
```

and access the onion domain in the browser. For example:

```
http://nekoiuqcbzrsufqi57umphejyfwwzes25qtuxuc27cdsalwcvnjrjwid.onion
```

> [!TIP]
> Be careful that the onion domain is not `https` but `http`. This is because the tor network is already encrypted and no need for `https`.
> 
