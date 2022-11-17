# helm-charts
A collection of Helm charts

## Goal

This repo contains Helm charts that I have developed to run applications in my home Kubernetes cluster.

This repo is not intended to be a replacement for any of the large collections
of Helm charts that are out there but it was born after the second time I had to rework my
chart setup because one of them got deprecated.

## Installation

The Helm repository can be installed as follows:

```console
helm repo add ntrp https://ntrp.github.io/helm-charts
```

You can then run `helm search repo ntrp` to search the charts.

## Documentation

Documentation can be found [here](https://ntrp.github.io/helm-charts/docs/).

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md)

## License

[Apache 2.0 License](./LICENSE)
