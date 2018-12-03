# FAMIXNGSQL [![Build Status](https://travis-ci.org/juliendelplanque/FAMIXNGSQL.svg?branch=master)](https://travis-ci.org/juliendelplanque/FAMIXNGSQL)
A meta-model for SQL databases using FAMIXNG with its generator.

## Install
Download the latest FamixNG image from the [CI](https://ci.inria.fr/moose/view/Moose%206.1/job/FamixNG/), open a playground and execute the following script:

```
Metacello new
  repository: 'github://juliendelplanque/FAMIXNGSQL/repository';
  baseline: 'FAMIXNGSQL';
  load
```

## Developing the meta-model generator
This section presents some tips and tricks that help in the development of the
meta-model.

### Modifying the meta-model generator
If you modified the generator and want to re-generate the meta-model, you have
to:
1. Ensure that no more instances of the meta-model exist in the system.
2. Run `FmxNewSQLMetamodelGenerator class>>#regenerateMetaModel`
