# rdp
Recursive Deterministic Perceptron (RDP)

A single-layer perceptron neural network is unable to solve non-linearly separable problems. However, the RDP can.<br>

Training data - a set of nineteen 2−element input vectors P and the corresponding nineteen 1−element targets T - a non-linearly separable classification problem:<br><br>
P = [ 2 1 2 5 7 2 3 6 1 2 5 4 6 5 7 8 7;<br>
    2 3 3 3 3 4 4 4 5 5 5 6 6 7 6 7 7 ];<br>
T = [ 0 0 0 1 1 0 0 1 0 0 1 1 1 1 0 0 0 ];<br><br>

<img width="280" alt="image" src="https://github.com/alina-ahmed-tech/rdp/assets/130942761/266b3f3a-774a-4336-a290-1bb5cd570b84"><br>
As you can see visually, these data points are non-linearly separable.<br><br>

The RDP works by first selecting a linearly separable subset from the original non-linearly separable problem. Then we create a perceptron to solve the linearly separable problem. Then we append the outputs/results of the trained perceptron to the input vectors of the original non-linearly separable problem, effectifvely adding a dimension (the input data changes from having 2 elements to 3 elements). The outputs of the first perceptron linearly separate the linearly separable subset from the rest of the data set. Lastly, we create a new perceptron with these new 3-element data inputs. <br><br>

<img width="224" alt="image" src="https://github.com/alina-ahmed-tech/rdp/assets/130942761/8a54526b-7f11-4b63-bf38-029589318e55"><br>
As you can see visually, these data points are now linearly separable with the added dimension.<br><br>


Visualisation of the hyperplane that correctly separates the different classes:<br>
<img width="250" alt="image" src="https://github.com/alina-ahmed-tech/rdp/assets/130942761/ceac0bb2-74c5-405c-a247-eab0e773d273"><br><br>
<img width="288" alt="image" src="https://github.com/alina-ahmed-tech/rdp/assets/130942761/3bbbe5c2-3401-45a1-8aea-84f341d19fc3"><br><br>







