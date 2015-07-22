%%%%%%%%%%%%%Evolution Strategy%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
close all
clc
load Parentsfile
load Projectfile

solutionN =struct([]);
parent1=zeros(empnum,tasknum);
parent2=zeros(empnum,tasknum);

thesi=Index(Nant);

%father and mother  from best solution and rand others
for k=1:1:(Nant/2)
    for i=1:1:empnum
    for j=1:1:tasknum
        if  mod(i,2)==mod(j,2)
            parent1(i,j)=solution(thesi).ant(i,j);
        else
            if ((length(unique(employee(i).skill)))>=(length(unique(task(j).skill))))%ελεγχος αν μπορει να κανει την δραστηριότητα
              a = 0; %Leveling
              b1 = employee(i).max;
              solutionN(k).ant(i,j)= (b1-a).*rand + a;%Xij for the fitness function
            else
              solutionN(k).ant(i,j)=solution(k).ant(i,j);
            end
        end
    end
    end
    solutionN(k).ant=solutionN(k).ant+parent1;
end

for k=(Nant/2):1:Nant
for i=1:1:empnum
    for j=1:1:tasknum
        if  mod(i,2)~=mod(j,2)
           parent2(i,j)=solution(thesi).ant(i,j);
        else
            if ((length(unique(employee(i).skill)))>=(length(unique(task(j).skill))))
              a = 0; 
              b1 = employee(i).max;
              solutionN(k).ant(i,j)= (b1-a).*rand+ a;
            else
              solutionN(k).ant(i,j)=solution(k).ant(i,j);
            end
        end
    end
end
solutionN(k).ant=solutionN(k).ant+parent2;
end
solutionN(k).ant=parent1+parent2;

for k=1:1:Nant
    solution(k).ant=solutionN(k).ant;
end

save('Populationfile','solution');
