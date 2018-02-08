# FAMIXNGSQL
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
```
FamixNGSQLEntity allSubInstances do: [ :e | e becomeForward: nil ].
Smalltalk garbageCollect.
```
2. Before re-generating the meta-model, run:
```
StatefulTraitsManager uniqueInstance cleanAll.
StatefulTraitsManager reset.
```
3. You can now re-generate the meta-model:
```
g := FAMIXNGSQLMetamodelGenerator new.
g cleanPackage.
g generate.
```

These 3 steps are equivalent to execute:
```
FAMIXNGSQLDevelopperTools regenerateFAMIXNGSQLMetaModel
```

### Saving the meta-model into a repository
To save the meta-model in a repository (e.g. on github), you have to execute the
following script first:
```
StatefulTraitsManager uniqueInstance cleanAll.
StatefulTraitsManager reset.
```

This is equivalent to execute:
```
FAMIXNGSQLDevelopperTools runThisBeforeSavingTheMetamodelInARepository
```

### Load the meta-model from a repository into a Pharo 6.1 image
To load the meta-model previously saved in a repository into a Pharo 6.1 image,
you need to:
1. Load it using for example Metacello.
2. Execute the following script:
```
StatefulTraitsManager uniqueInstance cleanAll.
StatefulTraitsManager reset.
StatefulTraitsManager uniqueInstance managePackageNamed: #FamixNGSQL.
```
