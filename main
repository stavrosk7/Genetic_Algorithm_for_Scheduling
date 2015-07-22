%%%%%%%%%%%%%initialization%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
close all
clc
InitialInstances;
GenerateInitialPopulation;
Selection_EvolutionaryOperators;
clear all
close all
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%Algorithm%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load Projectfile
load Pherofile
t=1; save('tfile','t');
while (t<=Ngen)
load Projectfile
load Pherofile
%%%%%%%%%%%%%Fitness%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Evaluate_Population=zeros(1,Nant);
Position=zeros(1,Nant);
for k=1:1:Nant
    Pover1=Pover(k);Pdur1=Pdur(k);Pcost1=Pcost(k);
    Evaluate_Population(k)=EvaluateObjectives(Pover1,Pdur1,Pcost1,wcost,wdur,wpenal,wundt,wreqsk,wover); 
    Position(k)=k;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%Sorting Population(Selection)%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
IEv=[Evaluate_Population
     Position];
[Y,Index]=sort(IEv(1,:));
Best=IEv(:,Index); %use the column indices from sort() to sort all columns of IEv.
save('Parentsfile','solution','Best','Index','Nant','employee','task','empnum','tasknum');
clear all
close all
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%Mutation & Crossover%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
UpdatePopulation;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%Update Pareto Set%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Selection_EvolutionaryOperators;
load tfile
t=t+1;
save('tfile','t');
load Projectfile
end
clear all

ReturnBestSolution;

