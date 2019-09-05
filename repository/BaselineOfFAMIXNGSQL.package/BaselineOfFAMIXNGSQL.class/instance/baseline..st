baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				package: #FAMIXNGSQLMetamodelGenerator
					with: [ spec requires: #('Famix') ];
				package: #'FamixNGSQL-Importer'
					with: [ spec
						requires: #('PostgreSQLParser' 'PgMetadata' 'SymbolResolver' 'PetitParser') ];
				package: #'FamixNGSQL-Extensions'
					with: [ spec requires: #('FamixNGSQL-Importer' 'TreeQuery') ];
				package: #FAMIXNGSQLAnalysis;
				package: #FamixNGSQL with: [ spec requires: #('Famix') ];
				package: #'FAMIXNGSQLAnalysis-ConnectionsManager'
					with: [ spec requires: #('DBConnectionsManager') ].
			spec
				baseline: 'Famix'
				with: [ spec
						repository: 'github://jecisc/Famix:v4.x.x/src';
						loads: #('Core' 'Basic') ].
			spec
				baseline: 'SymbolResolver'
				with: [ spec repository: 'github://Larcheveque/SymbolResolver:c6eb29c46cd36cabb8dff5d19329085ee8fa38c7/src' ].
			spec
				baseline: 'PostgreSQLParser'
				with: [ spec
						repository: 'github://juliendelplanque/PostgreSQLParser/src';
						loads: #('core') ].
			spec
				baseline: 'PetitParser'
				with: [ spec
						loads: #('Preprocessor');
						repository: 'github://moosetechnology/PetitParser/src' ].
			spec
				baseline: 'PgMetadata'
				with: [ spec repository: 'github://olivierauverlot/PgMetadata' ].
			spec
				baseline: 'DBConnectionsManager'
				with: [ spec
						repository: 'github://juliendelplanque/DBConnectionsManager/repository';
						loads: 'pgmetadata' ].
			spec
				baseline: 'TreeQuery'
				with: [ spec repository: 'github://juliendelplanque/TreeQuery/src' ] ]