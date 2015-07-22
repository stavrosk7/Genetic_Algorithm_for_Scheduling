function [ f ] = EvaluateObjectives (Pover,Pdur,Pcost,wcost,wdur,wpenal,wundt,wreqsk,wover)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

if Pover==0;
    Undt=0;Reqsk=0;
end
%Στέλνει Αντικειμενικές Συνάρτησέις που θα κάνω maximize
if ((Reqsk==0) && (Undt==0))		%Αν ολοκληρωθούν όλες οι δραστηριότητες && κανείς εργαζόμενος δεν υπερβει τον βαθμ.αφ. στο έργο
	f = 1/(wcost*Pcost+wdur*Pdur);		%p feasible solution  
else 
	f = 1/(wpenal+wundt*Undt+wreqsk*Reqsk+wover*Pover);	%q otherwise
end


end
