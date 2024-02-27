%Training data
%A NLS problem , with a set of nineteen 2−element input vectors P 
% and the corresponding nineteen 1−e lement targets T
P = [ 2 1 2 5 7 2 3 6 1 2 5 4 6 5 7 8 7;
    2 3 3 3 3 4 4 4 5 5 5 6 6 7 6 7 7 ];
T = [ 0 0 0 1 1 0 0 1 0 0 1 1 1 1 0 0 0 ];
%Plot
figure( 1 ) ; plotpv(P, T)

%Select a LS subset from within the NLS data set
P = [ 2 1 2 5 7 2 3 6 1 2 5 4 6 5 7 8 7 ; 
    2 3 3 3 3 4 4 4 5 5 5 6 6 7 6 7 7 ];
T = [ 0 0 0 1 1 0 0 1 0 0 1 1 1 1 1 1 1 ]; %modify some T values to make this problem LS
%Plot the data set
figure( 2 ) ;
plotpv(P, T)

% normalisation - calculate the min and max of each column and store the normalised values in the variable minMaxVal
minMaxVal = minmax(P) ;  

%a single-layer perceptron NN is created using the 'newp' function with 1 neuron/layer (hence 'single-layer' perceptron)
%by default the 'LEARNP' perceptron learning function is used as we didnt specify any other to be used
net = newp( minMaxVal , 1 ) ;

%Here we simulate the network s output , train for a maximum of 20 epochs , and then simulate it again.
simT = sim( net , P) %run the data through our NN - we have not trained the NN so thats why the output (in the command line) is all ones so its just a guess of the network without any training
net.trainParam.epochs = 10000 ;
net = train( net , P, T) ;
simT = sim( net , P) %training  
%the variable simT contains the trained networks guesses/predictions of the classes of the input data

%Plotting
figure( 3 ) ;
plotpc( net.iw { 1 , 1 } , net.b{ 1 } ) ; %plot the decision boundary based on the weights (net.iw{1, 1}) and bias (net.b{1}) of the trained NN

P = [ P; simT] %append predictions/guesses of the perceptron to the original data inputs
% - so now P (our data inputs) are 3-element data inputs (2 from P + 1 from simT), so we have added a new dimension to our problem, its now 3D,
T = [ 0 0 0 1 1 0 0 1 0 0 1 1 1 1 0 0 0] ; %change the T values back to the original data sets 

%create a new perceptron - it will solve our original NLS problem (because although P changed, T is the same as the original now)
%and deal with 3-D inputs instead of 2-D 

%normalise and plot the data
minMaxVal = minmax(P) ;
figure( 4 ) ;
plotpv(P, T) ;
%create the new perceptron and train the NN
net = newp( minMaxVal , 1 ) ; simT = sim( net , P)
net.trainParam.epochs = 10000 ;
net = train( net , P, T) ;
simT = sim( net , P)
%visualise by plotting the newly created hyperplane
hold on
plotpc(net.iw { 1 , 1 } , net.b{ 1 })
%store the trained NN guesses/predictions in the variable Y
net = train( net , P, T)
Y = sim( net , P)