baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				package: #FAMIXNGSQLMetamodelGenerator with: [ spec requires: #('Famix') ];
				package: #'FamixNGSQL-Importer' with: [ spec requires: #('PostgreSQLParser' 'PgMetadata' 'SymbolResolver' 'PetitParser') ];
				package: #'FamixNGSQL-Extensions' with: [ spec requires: #('FamixNGSQL-Importer') ];
				package: #FAMIXNGSQLAnalysis;
				package: #FamixNGSQL with: [ spec requires: #('Famix') ];
				package: #'FAMIXNGSQLAnalysis-ConnectionsManager' with: [ spec requires: #('DBConnectionsManager') ].
			spec baseline: 'Famix' with: [
				spec repository: 'github://jecisc/Famix:v2.x.x/src';
					loads: #('Core' 'Basic') ].
			spec baseline: 'SymbolResolver' with: [
				spec repository: 'github://Larcheveque/SymbolResolver/src'].
			spec baseline: 'PostgreSQLParser' with: [
				spec
					repository: 'github://juliendelplanque/PostgreSQLParser/src';
					loads: #('core') ].
			spec baseline: 'PetitParser' with: [
			spec
				loads: #('Preprocessor');
				repository: 'github://moosetechnology/PetitParser/src' ].
			spec baseline: 'PgMetadata' with: [ spec repository: 'github://olivierauverlot/PgMetadata' ].
			spec
				baseline: 'DBConnectionsManager'
				with: [ spec
						repository: 'github://juliendelplanque/DBConnectionsManager/repository';
						loads: 'pgmetadata' ] ]