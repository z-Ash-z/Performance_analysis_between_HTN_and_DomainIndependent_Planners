# Performance_analysis_between_HTN_and_DomainIndependent_Planners

Implemented actions for Metric-FF and Fast Downward domain-independent planners using PDDL. GTPyhop has been used to implement HTN Planner's actions and procedures in the Block World State and Satellite domains.

This project involves the comparison of the performance of the aforementioned planners for a range of issue sizes and assessed it using measures including the number of nodes investigated, CPU time, and plan length.

## Setting up the planners

- Domain independent planner
    - MetricFF - click [here](https://fai.cs.uni-saarland.de/hoffmann/metric-ff.html)
    - Fast Downward - click [here](https://www.fast-downward.org/Releases/22.12)
- HTN planner
    - GTPyhop - click [here](https://github.com/dananau/GTPyhop)

In this project the Domain independent planners are in domain_independent_planners folder and the HTN planners are in GTPyhop folder

## Activating the executables

- Before running any of the scripts we need to activate the executables. First cd to the project directory.
    ```
    cd <path to Performance_analysis_between_HTN_and_DomainIndependent_Planners>
    ```
- For activating the executables use the following commands
    ```
    cd domain_independent_planners/Metric-FF-v2.0/
    chmod +x ff
    cd ../fast-downward-22.12/
    ./build.py
    chmod +x fast-downward.py
    cd ../../Domains/BWD/
    chmod +x bws_pddl_run.sh
    cd ../Satellite_Domain/
    chmod +x sat_pddl_run.sh
    ```