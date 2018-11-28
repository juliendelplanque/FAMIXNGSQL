baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				package: #FAMIXNGSQLMetamodelGenerator with: [ spec requires: #('Famix') ];
				package: #'FamixNGSQL-Importer' with: [ spec requires: #('PostgreSQLParser' 'PgMetadata') ];
				package: #FAMIXNGSQLAnalysis;
				package: #FamixNGSQL with: [ spec requires: #('Famix') ];
				package: #'FAMIXNGSQLAnalysis-ConnectionsManager' with: [ spec requires: #('DBConnectionsManager') ].
			spec baseline: 'Famix' with: [
				spec
    				baseline: 'Famix'
    				with: [ spec repository: 'github://jecisc/Famix:v1.x.x/src' ] ].
			spec baseline: 'PostgreSQLParser' with: [
				spec
					repository: 'github://juliendelplanque/PostgreSQLParser/src';
					loads: #('core') ].
			spec baseline: 'PgMetadata' with: [ spec repository: 'github://olivierauverlot/PgMetadata' ].
			spec
				baseline: 'DBConnectionsManager'
				with: [ spec
						repository: 'github://juliendelplanque/DBConnectionsManager/repository';
						loads: 'pgmetadata' ] ]