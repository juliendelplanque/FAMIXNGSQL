meta-model regeneration
generate
	"This method is just there to make regeneration of the MM easy."
	<script>
	[ super generate ] on: Warning do: [ :warning |
		warning logCr.
		warning resume ]