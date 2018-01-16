# FAMIXNGSQL
A meta-model for SQL databases using FAMIXNG with its generator.

## Install
From a fresh Pharo 6.1 image, execute the following script in a playground:
```
"-- Update Iceberg --"
MetacelloPharoPlatform select. #( 'BaselineOfTonel' 'BaselineOfLibGit' 'BaselineOfIceberg' 'Iceberg-UI'  'Iceberg-Plugin-GitHub' 'Iceberg-Plugin'  'Iceberg-Metacello-Integration'  'Iceberg-Libgit-Tonel'  'Iceberg-Libgit-Filetree'  'Iceberg-Libgit'  'Iceberg'  'LibGit-Core' 'BaselineOfTonel' 'Iceberg-Libgit-Tonel' 'MonticelloTonel-Tests'  'MonticelloTonel-FileSystem' 'MonticelloTonel-Core'
 ) do: [ :each | (each asPackageIfAbsent: [ nil ]) ifNotNil: #removeFromSystem ]. ReRuleManager reset. Metacello new baseline: 'Iceberg'; repository: 'github://pharo-vcs/iceberg:v0.6.4'; load. 5 timesRepeat: [ Smalltalk garbageCollect ].
(Smalltalk classNamed: #Iceberg) enableMetacelloIntegration: true.

"--  Load FAMIXNG  --"

target := 'Moose' asFileReference ensureCreateDirectory.
repository := IceRepositoryCreator new
	remote: (IceRemote url: 'git@github.com:pavel-krivanek/Moose.git');
	location: target;
	subdirectory:'src/all';
	createRepository.
repository backend checkoutBranch: 'FamixNG-metamodelBuilder-qa'.
repository register.
Metacello new
  baseline: 'Moose';
  repository: 'tonel://./Moose/src/all';
  load.

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
g := FAMIXNGMetamodelGenerator new.
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
