Class Sample.Person Extends %Persistent [ ClassType = persistent, ProcedureBlock ]
{

Property FirstName As %String;

Property LastName As %String;

Property DOB As %Date;

Property Age1 As %Integer [ Calculated, SqlComputed, Transient ];

Property Age2 As %Integer [ Calculated, Transient ];

Property Age3 As %Integer [ Calculated, SqlComputed ];

Property Age4 As %Integer [ Calculated ];

Property Age5 As %Integer [ SqlComputed, Transient ];

Property Age6 As %Integer [ Transient ];

Property Age7 As %Integer [ SqlComputed ];

Property Age8 As %Integer [ SqlComputed, SqlComputeOnChange = DOB ];

// インデックスは、Trancient = true の時には作れない

// Index IndexAge1 on Age1;

// Index IndexAge2 on Age2;

// Index IndexAge5 on Age5;

// Index IndexAge6 on Age6;

Index IndexAge3 On Age3;

// インデックスは、SqlComputed = false の時には作れない

// Index IndexAge4 On Age4;

Index IndexAge7 On Age7;

Index IndexAge8 On Age8;

ClassMethod Age1Computation(cols As %Library.PropertyHelper) As %Integer
{
    set today = $zdate($now(),8)
    set bdate = $zdate(cols.getfield("DOB"), 8)
    return $select(bdate = "":"", 1:(today - bdate) \ 10000)
}

Method Age2Get() As %Integer
{
    set today = $zdate($now(),8)
    set bdate = $zdate(..DOB, 8)
    return $select(bdate = "":"", 1:(today - bdate) \ 10000)
}

ClassMethod Age3Computation(cols As %Library.PropertyHelper) As %Integer
{
    set today = $zdate($now(),8)
    set bdate = $zdate(cols.getfield("DOB"), 8)
    return $select(bdate = "":"", 1:(today - bdate) \ 10000)
}

Method Age4Get() As %Integer
{
    set today = $zdate($now(),8)
    set bdate = $zdate(..DOB, 8)
    return $select(bdate = "":"", 1:(today - bdate) \ 10000)
}

ClassMethod Age5Computation(cols As %Library.PropertyHelper) As %Integer
{
    set today = $zdate($now(),8)
    set bdate = $zdate(cols.getfield("DOB"), 8)
    return $select(bdate = "":"", 1:(today - bdate) \ 10000)
}

Method Age6Get() As %Integer
{
    set today = $zdate($now(),8)
    set bdate = $zdate(..DOB, 8)
    return $select(bdate = "":"", 1:(today - bdate) \ 10000)
}

ClassMethod Age7Computation(cols As %Library.PropertyHelper) As %Integer
{
    set today = $zdate($now(),8)
    set bdate = $zdate(cols.getfield("DOB"), 8)
    return $select(bdate = "":"", 1:(today - bdate) \ 10000)
}

ClassMethod Age8Computation(cols As %Library.PropertyHelper) As %Integer
{
    set today = $zdate($now(),8)
    set bdate = $zdate(cols.getfield("DOB"), 8)
    return $select(bdate = "":"", 1:(today - bdate) \ 10000)
}

ClassMethod CalculatedPropertyTest() As %Status
{
    do ..%KillExtent()
    set status = $$$OK
    set person = ..%New()
    set person.FirstName = "Kaoru"
    set person.LastName = "Shinuchi"
    set person.DOB = 60000
    set status = person.%Save()
    zwrite ^Sample.PersonD
    zwrite ^Sample.PersonI
    set statement=##class(%SQL.Statement).%New()
    set status=statement.%Prepare("Select * from Sample.Person")
    set rs = statement.%Execute()
    do rs.%Display()
    set person = ..%OpenId(1)
    set person.DOB = 50000
    set status = person.%Save()
    zwrite ^Sample.PersonD
    zwrite ^Sample.PersonI
    set statement=##class(%SQL.Statement).%New()
    set status=statement.%Prepare("Select * from Sample.Person")
    set rs = statement.%Execute()
    do rs.%Display()
    return status
}

Storage Default
{
<Data name="PersonDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>FirstName</Value>
</Value>
<Value name="3">
<Value>LastName</Value>
</Value>
<Value name="4">
<Value>DOB</Value>
</Value>
<Value name="5">
<Value>Age7</Value>
</Value>
<Value name="6">
<Value>Age8</Value>
</Value>
</Data>
<DataLocation>^Sample.PersonD</DataLocation>
<DefaultData>PersonDefaultData</DefaultData>
<ExtentSize>1</ExtentSize>
<IdLocation>^Sample.PersonD</IdLocation>
<IndexLocation>^Sample.PersonI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Age1">
<AverageFieldSize>3</AverageFieldSize>
<OutlierSelectivity>.999999:18</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Age3">
<AverageFieldSize>3</AverageFieldSize>
<OutlierSelectivity>.999999:18</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Age5">
<AverageFieldSize>3</AverageFieldSize>
<OutlierSelectivity>.999999:18</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Age7">
<AverageFieldSize>3</AverageFieldSize>
<OutlierSelectivity>.999999:18</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Age8">
<AverageFieldSize>3</AverageFieldSize>
<OutlierSelectivity>.999999:18</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="DOB">
<AverageFieldSize>4</AverageFieldSize>
<OutlierSelectivity>.999999:60000</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="FirstName">
<AverageFieldSize>7</AverageFieldSize>
<OutlierSelectivity>.999999:"Kaoru"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="LastName">
<AverageFieldSize>10</AverageFieldSize>
<OutlierSelectivity>.999999:"Shinuchi"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="IndexAge3">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="IndexAge7">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="IndexAge8">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^Sample.PersonS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
