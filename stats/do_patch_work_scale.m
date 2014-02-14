%This function reads the results dumped by scalability_test.m and creates a
%unified sequential and am_data cell matrices
function [am_data_new,sequential_new,param0,decision_nodes_array_new] = ...
                        do_patch_work_scale(result_path,cost_model_type)

                    
if(cost_model_type==2)
    load([result_path 'scale2/run_scalability_7_9_11_r100_cost_type_2.mat'],...
        'am_data','sequential','param0');

    am_data1 = am_data;
    sequential1 = sequential;

    load([result_path 'scale2/run_scalability_8_10_12_r100_cost_type_2.mat'],...
        'am_data','sequential');

    am_data_new = [am_data1(1,:);am_data(1,:);...
                    am_data1(2,:);am_data(2,:);...
                    am_data1(3,:);am_data(3,:)];
    sequential_new = [sequential1(1,:);sequential(1,:);...
                        sequential1(2,:);sequential(2,:);...
                        sequential1(3,:);sequential(3,:)];
    decision_nodes_array_new = [7 8 9 10 11 12];
    
    
    load([result_path 'scale2/run_scalability_13_r10_cost_type_2.mat'],...
        'am_data','sequential');
    sequential_tweaked = sequential;
    for i=1:90
        sequential_tweaked{1,end+1}.feasible = 0;
    end
    am_data_new = [am_data_new;[am_data cell(1,90)]];
    sequential_new = [sequential_new;sequential_tweaked];
    decision_nodes_array_new = [decision_nodes_array_new 13];
else
    load([result_path 'scale1/run_scalability_7_9_11_r100_cost_type_1.mat'],...
        'am_data','sequential','param0','decision_nodes_array');

    am_data1 = am_data;
    sequential1 = sequential;

    load([result_path 'scale1/run_scalability_8_10_12_r100_cost_type_1.mat'],...
        'am_data','sequential');

    am_data_new = [am_data1(1,:);am_data(1,:);...
                    am_data1(2,:);am_data(2,:);...
                    am_data1(3,:);am_data(3,:)];
    sequential_new = [sequential1(1,:);sequential(1,:);...
                        sequential1(2,:);sequential(2,:);...
                        sequential1(3,:);sequential(3,:)];
    decision_nodes_array_new = [7 8 9 10 11 12];
    
    
    load([result_path 'scale1/run_scalability_7_9_11_13_r10_cost_type_1.mat'],...
        'am_data','sequential');
    am_data = am_data(4,:);
    sequential_tweaked = sequential(4,:);
    for i=1:90
        sequential_tweaked{1,end+1}.feasible = 0;
    end
    am_data_new = [am_data_new;[am_data cell(1,90)]];
    sequential_new = [sequential_new;sequential_tweaked];
    decision_nodes_array_new = [decision_nodes_array_new 13];
end
