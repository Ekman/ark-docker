# Ark Docker

Run a [Ark](https://store.steampowered.com/app/346110/Ark/) dedicated server using Docker. There are plenty of other solutions out there that has way more features than this. I wanted a bare minimum setup.

## Installation

The image can be found at:

```sh
docker pull ghcr.io/ekman/ark:1
```

## Configuration

View the [example `docker-compose.yml` file](docker-compose.yml) for indications on how to install, configure and run this.

### Ports

Open UDP ports `7777`, `7778` and `27015` on your router and forward them to the hosting server/computer.

### Volumes

Mount all these volumes to your host.

| Directory inside container | Description |
| --- | --- |
| `/home/steam/game` | Contains the game files |

### Configuration

Configure by setting environment variables. See below for an explanation of all available environment variables.

| Name | Description |
| --- | --- |
| `MAP` | [Name of the map](https://ark.wiki.gg/wiki/Server_configuration#Map_names) that you want to host. |

On your first launch the game will generate configuration files in within your game directory.


### Updating the game files

The game files will update when the container starts. I recommend adding the following cron job to
continuously restart the server:

```sh
0 4 * * * /usr/local/bin/docker-compose --file /path/to/docker-compose.yml restart ark >/dev/null 2>&1
```

## Versioning

This project complies with [Semantic Versioning](https://semver.org/).

## Changelog

For a complete list of changes, and how to migrate between major versions, see [releases page](https://github.com/Ekman/ark-docker/releases).
