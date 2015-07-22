clear all
close all
clc

tasknum=-1;                 %number of the tasks
empnum=-1;                  %number of the employees
empsknum=-1;                %number of the employees skills max
tasksknum=-1;               %number of the task skills max
arcnum=-1;                  %number of arc lines
graph=zeros(30);            %the graph of tasks
Ngen = 15;				%Generation number
Nant = 400;				%Number of ants in a generation
b = 1.1;                    %The importance rate of swarm exp.
wcost = 0.000001;			%The weight of cost
wdur = 0.1;                 %The weight of duration
wt_cost = 0.000001;			%The weight of task cost
wt_dur = 0.1;				%The weight of task duration
wover = 0.1;				%The weight of overwork
wpenal = 100;				%Penalty constant
wreqsk = 10;				%The weight of number of required skills
wundt =	10;                 %The weight of number of undone tasks
%max  inst30-15-10.conf
%employees 15 skills 10
%tasks 30 skills 10
task = struct([]);%struct for the tasks
employee = struct([]);%struct for the employees
for lkk=1:1:30
    for skilp=1:1:10
        task(lkk).skill(skilp)=-1;
    end
    task(lkk).effort = 0.0;
end
for lkk=1:1:15
    for skilp=1:1:10
        employee(lkk).skill(skilp)=-1;
    end
    employee(lkk).max=0;
    employee(lkk).salary=0.0;
end

%project file
fid = fopen('inst10-10-10-5.cfg','r'); %open instances
if fid<0, error('cannot open file %s\n',a); end;
while ~feof(fid)
    line = strtrim(fgetl(fid));
    if (isempty(line) || all(isspace(line)) || strncmp(line,'#',1) || strncmp(line,';',1)||strncmp(line,',',1)); % no operation 
    else 
        %-----------------string trim------------------
        [var,tok] = strtok(line,'.');
        [var1,tok1] = strtok(tok,'.');
        [var2,tok2] = strtok(tok1,'.');
        [var3,tok3] = strtok(tok2,'=');
        [var4,tok4] = strtok(tok3,'=');        
        line2=tok;
        [var1a,tok1a] = strtok(line2,'=');
        line3=tok1;
        [var2a,tok2a] = strtok(line3,'=');   
        line4=var2;
        [var3a,tok3a] = strtok(line4,' ');
        line5=tok1a;
        [zsf,zzs] = strtok(line5,'=');
        line6=var3;
        [zzzasd,zzzdsa] = strtok(line6,'.');
        line7 = tok3a;
        [klj,wsx]=strtok(line7,' ');
        [gr1,gr2] = strtok(var3a,'=');
        [gra1,gra2] = strtok(zsf,' ');
        %-----------------search-------------------------
        if (strcmp(var,'task')==1)
            if (strcmp(var1a,'.number')==1)
                tasknum=str2double(zsf);end
            if (strcmp(var2,'skill')==1)
                if(strcmp(var3,'.number')==1)
                    if(tasknum<str2double(var4)),tasksknum=str2double(var4);end
                    %task.7.skill.number -->var4
                else
                task(str2double(var1)+1).skill(str2double(zzzasd)+1)=str2double(var4);
                %task.7.skill.1 ------->var4
                end
            end
            if(strcmp(var2a,'.cost')==1)
                task(str2double(var1)+1).effort=str2double(zsf);end
                %task.7.cost.1 ------->var4             
        end
        if (strcmp(var,'employee')==1)
            if (strcmp(var1a,'.number')==1)
                empnum=str2double(zsf); end
            if (strcmp(var2,'skill')==1);
                if(strcmp(var3,'.number')==1)
                    if (empsknum<str2double(var4)),empsknum=str2double(var4);end
                    %employee.7.skill.number -->var4
                else                
                employee(str2double(var1)+1).skill(str2double(zzzasd)+1)=str2double(var4);
                %p.x employee.7.skill.1 -->var4
                end
            end
            if (strcmp(var2a,'.salary')==1);
                employee(str2double(var1)+1).salary = str2double(zsf);end
                %var1 ergazomenos
                %zsf mis8os
                %p.x employee.0.salary=12315.545465456            
        end
        if (strcmp(var,'graph')==1)
            if (strcmp(var1,'arc')==1)
                if(strcmp(var1a,'.arc.number')==1)
                    arcnum=str2double(zsf);
                else
                 grp1=str2double(klj);
                 grp2=str2double(gra1);
                 grp3=str2double(gr1);
                 graph(grp2+1,grp1+1)=1;
                %graph(grp2+1,grp1+1)=grp3;
                %graph(grp2+1).edge=grp3+1;
                %graph(grp2+1).ratio=grp1;
                %graph(grp2+1,grp3+1)=grp1;
                %graph(gr1,gra1)= klj; graph(gra1,gr1)=klj
                %var3a shmeio grafou p.x 9=1   to edge 9->grp3 - 1->grp2
                %klj ari8mos apostashs
                end
            end
        end
    end    
end;
fclose(fid);

%humans dedication file
fid = fopen('dedication.cfg','r');%open employees instances 
if fid<0, error('cannot open file %s\n',a); end;
while ~feof(fid)
    line = strtrim(fgetl(fid));
    if (isempty(line) || all(isspace(line)) || strncmp(line,'#',1) || strncmp(line,';',1)||strncmp(line,',',1)); % no operation 
    else
        [var,tok] = strtok(line,'.');
        [var1,tok1] = strtok(tok,'.');
        [var2,tok2] = strtok(tok1,'=');
        [var3,tok3] = strtok(tok2,'//');
        [var4,tok4] = strtok(var3,'=');
        if (str2double(var1)<=empnum)
            employee(str2double(var1)).max=str2double(var4);
        end
    end
end
fclose(fid);


%algorithm parameters file
%To κάνω στην Αρχή
% fid = fopen('algorithm_parameters.cfg','r');%open employees instances 
% if fid<0, error('cannot open file %s\n',a); end;
% while ~feof(fid)
%     line = strtrim(fgetl(fid));
%     if (isempty(line) || all(isspace(line)) || strncmp(line,'#',1) || strncmp(line,';',1)||strncmp(line,',',1)); % no operation 
%     else
%         [var,tok] = strtok(line,'%');
%         [var1,tok1] = strtok(var,'=');
%         [var2,tok2] = strtok(tok1,'=');
%         if (strcmp(var1,'Ngen ')==1)
%             Ngen = str2double(var2);end
%         if (strcmp(var1,'Nant ')==1)
%             Nant = str2double(var2);end
%         if (strcmp(var1,'b ')==1)
%             b = str2double(var2);end
%         if (strcmp(var1,'wcost ')==1)
%             wcost = str2double(var2);end
%         if (strcmp(var1,'wdur ')==1)
%             wdur = str2double(var2);end
%         if (strcmp(var1,'wt_cost ')==1)
%             wt_cost = str2double(var2);end
%         if (strcmp(var1,'wt_dur ')==1)
%             wt_dur = str2double(var2);end
%         if (strcmp(var1,'wover ')==1)
%             wover = str2double(var2);end
%         if (strcmp(var1,'wpenal ')==1)
%             wpenal = str2double(var2);end
% 		if (strcmp(var1,'wreqsk ')==1)
%             wreqsk = str2double(var2);end		
%         if (strcmp(var1,'wundt ')==1)
%             wundt = str2double(var2);end
%     end
% end
% fclose(fid);

G1=graph(1:tasknum,1:tasknum);

save('Projectfile','G1','b','Nant','Ngen','arcnum','employee','empnum','empsknum','task','tasknum','tasksknum','wcost','wdur','wover','wpenal','wreqsk','wt_cost','wt_dur','wundt');
%save myfile

%Plot the Project Data
figure;
subplot(2,1,1); %task skills PLOT
y2 = zeros(tasknum,tasksknum);
for zfsk=1:1:tasknum
    for sakl=1:1:tasksknum
        if(task(zfsk).skill(sakl) == -1)
        y2(zfsk,sakl) = 0;    
        else    
        y2(zfsk,sakl) = task(zfsk).skill(sakl);
        end
    end   
end
bar(y2);
xlabel('Tasks');
ylabel('Skill');
hold on;

subplot(2,1,2); %employee skills PLOT
y1 = zeros(empnum,empsknum);
for zfsk=1:1:empnum
    for sakl=1:1:empsknum
        if(employee(zfsk).skill(sakl) == -1)
        y1(zfsk,sakl) = 0;    
        else    
        y1(zfsk,sakl) = employee(zfsk).skill(sakl);
        end
    end   
end
bar(y1);
xlabel('Employees');
ylabel('Skill');
hold on;

bg = biograph(G1,[],'ShowArrows','on','ShowWeights','off');
h = view(bg);
hold on;
