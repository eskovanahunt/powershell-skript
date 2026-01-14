#Practice 2
#Create 2 hashtables as below and the third hashtable should be calculated as (DaysWorked *SalaryPerDay).
# Hashtable 1: Days Worked
$DaysWorked = @{
    John = 12
    Joe  = 20
    Mary = 18
}
$SalaryPerDay = @{
    John = 100
    Joe  = 120
    Mary = 150
}
$Salary = @{}

foreach ($name in $DaysWorked.Keys) {
    $Salary[$name] = $DaysWorked[$name] * $SalaryPerDay[$name]
}
