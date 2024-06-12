enum HairColors {
	Blond = 1
	Brown = 2
	Black = 3
	Red = 4
	Other = 5
}

class Person {
	[string] $Name
	[int] $BirthYear
	[HairColors] $HairColor

	[int] GetAge() {
		return [DateTime]::Now.Year - $this.BirthYear
	}
}

$person = [Person]::new()
$person.Name = "John"
$person.BirthYear = 1980
$person.HairColor = [HairColors]::Blond
$person.GetAge()
$person

# $person.LastName = 'Doe' # Error: Property 'LastName' cannot be found on this object. Make sure that it exists.

# $dynamicPerson = [PSCustomObject]@{
# 	Name = "Jim"
# 	BirthYear = 1970
# 	HairColor = [HairColors]::Red
# }
# $dynamicPerson

# $dynamicPerson2 = [PSCustomObject]@{
# 	Name = "Jane"
# 	LastName = "Doe"
# 	BirthYear = 2002
# }
# $dynamicPerson2
