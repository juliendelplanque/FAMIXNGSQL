private
loadMetaData
	metadata := (PgMetadata database: self databaseName connection: self connection) extractMetadata.
	^ metadata