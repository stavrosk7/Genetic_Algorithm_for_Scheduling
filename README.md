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

The files of the Project.

* ``main.m``:  this [script](https://github.com/skalaouzis/Genetic_Algorithm_for_Scheduling/blob/master/main.m) is	the main program.
* |__ ``InitialInstances.m``:  this [script](https://github.com/skalaouzis/Genetic_Algorithm_for_Scheduling/blob/master/InitialInstances.m) is the problem constructor.
* |____ ``inst10-10-10-5.cfg``:  this  [script](https://github.com/skalaouzis/Genetic_Algorithm_for_Scheduling/blob/master/inst10-10-10-5.cfg) is the dataset with 10 tasks, 10 employees and 5 related skills in Task Precedence Graph (TPG).
* |____ ``algorithm_parameters.cfg``:  this  [script](https://github.com/skalaouzis/Genetic_Algorithm_for_Scheduling/blob/master/algorithm_parameters.cfg) is the default constructor of algorithm.	
* |____ ``dedication.cfg``:  this [script](https://github.com/skalaouzis/Genetic_Algorithm_for_Scheduling/blob/master/dedication.cfg) is the data about employees(resources) constraints
* |__ ``GenerateInitialPopulation.m``:  this  [script](https://github.com/skalaouzis/Genetic_Algorithm_for_Scheduling/blob/master/GenerateInitialPopulation.m) is the	function which creates the first population of available solutions.
* |__ ``Selection_EvolutionaryOperators.m``:  this [script](https://github.com/skalaouzis/Genetic_Algorithm_for_Scheduling/blob/master/Selection_EvolutionaryOperators.m) is the	main function.
* |____ ``findpaths.m``:  this [script](https://github.com/skalaouzis/Genetic_Algorithm_for_Scheduling/blob/master/findpaths.m) is the CPM evaluator.	
* |__ ``EvaluateObjectives.m``:  this [script](https://github.com/skalaouzis/Genetic_Algorithm_for_Scheduling/blob/master/EvaluateObjectives.m) is the	function which sorts the  available solutions.
* |__ ``UpdatePopulation.m``:  this [script](https://github.com/skalaouzis/Genetic_Algorithm_for_Scheduling/blob/master/UpdatePopulation.m) is the	function which creates the new available solutions.
* |__ ``ReturnBestSolution.m``:  this [script](https://github.com/skalaouzis/Genetic_Algorithm_for_Scheduling/blob/master/ReturnBestSolution.m) is the	function which returns the results.



## Support

Please [open an issue](https://github.com/fraction/readme-boilerplate/issues/new) for support.

## Contributing

Please contribute using [Github Flow](https://guides.github.com/introduction/flow/). Create a branch, add commits, and [open a pull request](https://github.com/fraction/readme-boilerplate/compare/).


