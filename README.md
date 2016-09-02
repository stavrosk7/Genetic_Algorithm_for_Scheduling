# Genetic Algorithm for Solving [Software Project Scheduling Problems](http://tracer.lcc.uma.es/problems/psp/index.html).

By [Stavros Kalaouzis](https://github.com/skalaouzis).

Paper: [name, name, name., "paper name", resource:number (2016)](http://www.google.com).

## Information

That genetic algorithm obtains the [data](http://tracer.lcc.uma.es/problems/psp/generator.html) of the problem regarding the tasks and the employees of the project. In this process it groups the tasks through an evolutionary strategy. The outcome provides a solution with the corresponding cost and duration of the project tasks within their given constraints.


The Project Scheduling Problem (PSP) consists in deciding who does what during the software project lifetime. It is related to the Resource-Constrained Project Scheduling (RCPS), an existing problem very popular in the literature. However, the problem defined here includes the concept of employee with salary and personal skills, also able of performing several tasks in a normal working day.


## Description 	


The resources considered are people with a set of skills, a salary, and a maximum dedication to the project. Formally, each person (employee) is denoted with ei where i goes from 1 to E (the number of employees). Let SK be the set of skills, and si the i-th skill for i varying from 1 to S=|SK|. The skills of the employee ei will be denoted with eisk that is a subset of SK, the monthly salary with eisa, and the maximum dedication to the project with eimd. The salary and the maximum dedication are both real numbers. The former is expressed in fictitious currency units, while the latter is the ratio between the amount of hours dedicated to the project and the full working day length of the employee. For example, a maximum dedication of 0.75 means that the employee spends at most 75% of its working day to tasks of the project. A dedication greater than 1.0 means that the employee works overtime, a quite real world feature included in our problem definition.


The tasks are denoted with ti for i from 1 to T (the number of tasks). Each task ti has a set of required skills associated to it that we denote with tisk and an effort tief expressed in person-per-month (PM). The tasks must be performed according to a Task Precedence Graph (TPG). The TPG indicates what tasks must be completed before the beginning of a new task. The TPG is an acyclic directed graph G(V,A) with a vertex set V={t1, t2, ..., tT} and an arc set A where (ti, tj) belongs to A if the task ti must be completed, with no other intervening tasks, before task tj can start.


Our objectives are to minimize the cost, the duration of the project, and the overtime of the employees. The constraints are that each task must be performed by at least one person and the set of required skills of a task must be included in the union of the skills of the employees performing the task. The number of skills measures the degree of specialization of the knowledge. That is, with a larger number of skills the knowledge needed to perform the whole software project is divided into a greater number of portions than if it needs a reduced number of skills. Two examples could be developing a software for controlling a plain (large variety of skill needed) versus programming salary sheets for the administration of a company.


Once we know the elements of a problem instance, let us proceed to describe the elements of a solution to the problem. A solution can be represented with a matrix X=(xij) of size ExT. The element xij is the dedication degree of the employee ei to the task tj. If the employee ei performs the task tj with a 0.5 dedication degree he/she spends half of his/her working day in the task. If an employee does not perform a task he/she will have a dedication degree of 0 to that task. This information helps to compute the duration of each task and, indeed, the start and end time of each one, i.e., the time schedule of the tasks. From this schedule we can compute the duration of the project. The cost can be calculated after the duration of the tasks accounting also for the dedication and salary of the employees. Finally, the overtime of each employee can be calculated using the time schedule of the tasks and the dedication matrix X.

## Experiments

Bla bla

|  Dataset  |  Result |
|:---------:|:-------:|
| name.     |     n%  |
| name      |     n%  |

1.  First  plot:
![one](https://github.com/r10.png "one")
2.  Second Plot:
![two](https://github.com/100.png "two")

## Installation

Download to your project directory, add `README.md`, and commit:

```sh
curl -LO http://git.io/Xy0Chg
git add README.md
git commit -m "Use README Boilerplate"
```

## Usage

Replace the contents of `README.md` with your project's:

* Name
* Description
* Installation instructions
* Usage instructions
* Support instructions
* Contributing instructions

Feel free to remove any sections that aren't applicable to your project.

## Support

Please [open an issue](https://github.com/fraction/readme-boilerplate/issues/new) for support.

## Contributing

Please contribute using [Github Flow](https://guides.github.com/introduction/flow/). Create a branch, add commits, and [open a pull request](https://github.com/fraction/readme-boilerplate/compare/).


