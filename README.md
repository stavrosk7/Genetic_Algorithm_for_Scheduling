# Genetic Algorithm for Solving [Software Project Scheduling Problems](http://tracer.lcc.uma.es/problems/psp/index.html).

By [Stavros Kalaouzis](https://github.com/skalaouzis)., 2015

## Information

That genetic algorithm obtains the [data](http://tracer.lcc.uma.es/problems/psp/generator.html) of the problem regarding the tasks and the employees of the project. In this process it groups the tasks through an evolutionary strategy. The outcome provides a solution with the corresponding cost and duration of the project tasks within their given constraints.

## Description 	

The Project Scheduling Problem (PSP) consists in deciding who does what during the software project lifetime. It is related to the Resource-Constrained Project Scheduling (RCPS), an existing problem very popular in the literature. However, the problem defined here includes the concept of employee with salary and personal skills, also able of performing several tasks in a normal working day.

![psp](http://tracer.lcc.uma.es/problems/psp/ingsw-instance.gif )

## Installation and Usage

The source code in Matlab and compiled executables with an interactive interface are available at: 
```sh
https://github.com/skalaouzis/Genetic_Algorithm_for_Scheduling)
```
You can either make a local or a global installation. 

* Open: the folder ``GeneticAlgorithmforScheduling`` 
* Edit: the `` .cfg`` ﬁles in the folder ``GeneticAlgorithmforScheduling`` 
* Run: ``GeneticAlgorithmforScheduling/main.m``



#### [``main.m``](https://github.com/skalaouzis/Genetic_Algorithm_for_Scheduling/blob/master/main.m):	the main program.
##### ``InitialInstances.m``	
###### ``inst10-10-10-5.cfg``
###### ``algorithm_parameters.cfg``	
###### ``dedication.cfg``
##### ``GenerateInitialPopulation.m``	
##### ``Selection_EvolutionaryOperators.m``	
######  ``findpaths.m``	
##### ``EvaluateObjectives.m``	
##### ``UpdatePopulation.m``	
##### ``ReturnBestSolution.m``	



## Support

Please [open an issue](https://github.com/fraction/readme-boilerplate/issues/new) for support.

## Contributing

Please contribute using [Github Flow](https://guides.github.com/introduction/flow/). Create a branch, add commits, and [open a pull request](https://github.com/fraction/readme-boilerplate/compare/).


