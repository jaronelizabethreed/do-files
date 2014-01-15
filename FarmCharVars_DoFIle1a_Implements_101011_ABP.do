*Use Dataset N from Household data
use "R:\Project\EPAR\Tanzania LSMS-ISA 2008\Data - Household Module Original\SEC_N.dta"

//Create dummy variables for farm implements and variables for number of implements

gen hoe=1 if sncode==440 & snq1>0
gen num_hoe=snq1 if hoe==1

gen spraymach=1 if sncode==441 & snq1>0
gen num_spraymach=snq1 if spraymach==1

gen waterpump=1 if sncode==442 & snq1>0
gen num_waterpump=snq1 if waterpump==1

gen reaper=1 if sncode==443 & snq1>0
gen num_reaper=snq1 if reaper==1

gen tractor=1 if sncode==444 & snq1>0
gen num_tractor=snq1 if tractor==1

gen trailor=1 if sncode==445 & snq1>0
gen num_trailor=snq1 if trailor==1

gen plough=1 if sncode==446 & snq1>0
gen num_plough=snq1 if plough==1

gen harrow=1 if sncode==447 & snq1>0
gen num_harrow=snq1 if harrow==1

gen milkmach=1 if sncode==448 & snq1>0
gen num_milkmach=snq1 if milkmach==1

gen harvthreshmach=1 if sncode==449 & snq1>0
gen num_harvthreshmach=snq1 if harvthreshmach==1

gen handmillmach=1 if sncode==450 & snq1>0
gen num_handmillmach=snq1 if handmillmach==1

gen coffeepulpmach=1 if sncode==451 & snq1>0
gen num_coffeepulpmach=snq1 if coffeepulpmach==1

gen fertdist=1 if sncode==452 & snq1>0
gen num_fertdist=snq1 if fertdist==1

//Create global lists

global implement hoe spraymach waterpump reaper tractor trailor plough harrow milkmach harvthreshmach handmillmach coffeepulpmach fertdist

global num_implement num_hoe num_spraymach num_waterpump num_reaper num_tractor num_trailor num_plough num_harrow num_milkmach num_harvthreshmach num_handmillmach num_coffeepulpmach num_fertdist

foreach X of varlist $num_implement{
tab `X'
}

//Collapse to the household level
collapse (max) $implement $num_implement, by(hhid)
