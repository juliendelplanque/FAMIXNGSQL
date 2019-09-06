*FamixNGSQL-Importer
from
	^ self source ifNil: [ self foreignKeyConstraintSource ]