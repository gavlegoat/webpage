---
title: "CS342: Neural Networks"
date: 2022-01-05
---

In this course, we discuss the basics of deep neural networks. We will look at
different neural architectures, as well as how to train, tune, and test
networks. We will cover both the theory and practice of deep learning, using
hands-on implementations in PyTorch. We will then briefly look at a number of
common applications of deep learning including computer vision, sequence
modeling, deep reinforcement learning, and generative modeling. Over the course
of the homework assignments, we will develop a vision system for a racing
simulator, SuperTuxKart.

## Logistics

The class meets Monday and Wednesday from  2:00 to 3:30. We will be meeting on
Zoom for the foreseeable future (see Canvas for Zoom links), but if we are able
to come back to in-person learning, then we will meet in JGB 2.216.

We will use Piazza for discussions and Canvas for homework. We will start each
Monday class with a quiz, and then we will go through the quiz questions in
class. After that, we'll generally use about half the class time for lecture
and half to start on a coding exercise related to the topics we just covered.
The coding exercise will be done either in small groups or as a class
discussion. On Wednesdays we will again use approximately half the class for
lectures and half to continue the coding exercise from Monday.

## Calendar

This calendar should be considered tentative. While we plan to stick to this
schedule as closely as possible, we may delay or reorder topics as issues come
up during the semester. The homework due dates will not be moved earlier.

| Date   | Topic                                           | Exercise                                           | Resources                                                                             |
|:------:|-------------------------------------------------|----------------------------------------------------|---------------------------------------------------------------------------------------|
| 1/19   | Introduction, background                        |                                                    | [Slides](/cs342-lectures/lecture01.pdf)                                               |
| 1/24   | Background - Tensors, broadcasting              | [KNN](/cs342-exercises/knn.ipynb)                  | [Slides](/cs342-lectures/lecture02.pdf), [Notebook](/cs342-notebooks/lecture02.ipynb) |
| 1/26   | Background - Probability                        | [KNN](/cs342-exercises/knn.ipynb)                  | [Slides](/cs342-lectures/lecture03.pdf)                                               |
| 1/31   | Models - Linear, computation graphs             | [Linear classifier](/cs342-exercises/linear.ipynb) | [Slides](/cs342-lectures/lecture04.pdf), [Notebook](/cs342-notebooks/lecture04.ipynb) |
| 2/2    | Training - Optimization, loss                   | [Linear classifier](/cs342-exercises/linear.ipynb) | [Slides](/cs342-lectures/lecture05.pdf)                                               |
| 2/7    | Models - Nonlinearities                         | [MLP](/cs342-exercises/mlp.ipynb)                  | [Slides](/cs342-lectures/lecture06.pdf)                                               |
| 2/9    | Models - Layers, activation, hyperparameters    | [MLP](/cs342-exercises/mlp.ipynb)                  | [Slides](/cs342-lectures/lecture07.pdf), [Supplement](/cs342-lectures/l07-supp.pdf)   |
| *2/13* | **HW1 is due at 11:59 PM**                      |                                                    | [Assignment](/cs342/homework1/)                                                       |
| 2/14   | CNN - Convolution, pooling                      | [CNN](/cs342-exercises/cnn.ipynb)                  | [Slides](/cs342-lectures/lecture08.pdf)                                               |
| 2/16   | CNN - Receptive field, principles               | [CNN](/cs342-exercises/cnn.ipynb)                  | [Slides](/cs342-lectures/lecture09.pdf)                                               |
| 2/21   | CNN - Dilation, upconvolution, ResNets          | [CNN Blocks](/cs342-exercises/resnet.ipynb)        | [Slides](/cs342-lectures/lecture10.pdf), [Supplement](/cs342-notebooks/visualization.zip) |
| 2/23   | Practicalities - Data splitting, Initialization | [CNN Blocks](/cs342-exercises/resnet.ipynb)        | [Slides](/cs342-lectures/lecture11.pdf), [Supplement](/cs342-lectures/l11-supp.pdf), [Notebook](/cs342-notebooks/lecture11.ipynb) |
| *2/27* | **HW2 is due at 11:59 PM**                      |                                                    | [Assignment](/cs342/homework2/)                                                       |
| 2/28   | Pracitcalities - Normalization                  | [Image gen.](/cs342-exercises/generation.ipynb)    | [Slides](/cs342-lectures/lecture12.pdf), [Notebook](/cs342-notebooks/lecture12.ipynb) |
| 3/2    | Practicalities - Overfitting                    | [Image gen.](/cs342-exercises/generation.ipynb)    | [Slides](/cs342-lectures/lecture13.pdf), [Notebook](/cs342-notebooks/lecture13.ipynb) |
| 3/7    | Practicalities - Overfitting                    | [Binary segment.](/cs342-exercises/segment.ipynb)  | [Slides](/cs342-lectures/lecture14.pdf)                                               |
| 3/9    | Practicalities - Learning rate, Optim Algorithms| [Binary segment.](/cs342-exercises/segment.ipynb)  | [Slides](/cs342-lectures/lecture15.pdf), [Notebook](/cs342-notebooks/lecture15.ipynb) |
| 3/14   | Spring break                                    |                                                    |                                                                                       |
| 3/16   | Spring break                                    |                                                    |                                                                                       |
| *3/20* | **HW3 is due at 11:59 PM**                      |                                                    | [Assignment](/cs342/homework3/)                                                       |
| 3/21   | Vision - Classification                         | [Keypoint est.](/cs342-exercises/keypoint.ipynb)   | [Slides](/cs342-lectures/lecture16.pdf)                                               |
| 3/23   | Vision - Object detection                       | [Keypoint est.](/cs342-exercises/keypoint.ipynb)   | [Slides](/cs342-lectures/lecture17.pdf)                                               |
| 3/28   | Vision - Segmentation                           | [Keypoint est.](/cs342-exercises/keypoint.ipynb)   | [Slides](/cs342-lectures/lecture18.pdf)                                               |
| 3/30   | Vision - Temporal models                        | [Keypoint est.](/cs342-exercises/keypoint.ipynb)   |                                                                                       |
| *4/3*  | **HW4 is due at 11:59 PM**                      |                                                    | [Assignment](/cs342/homework4/)                                                       |
| 4/4    | RL - Imitation learning                         | Imitation                                          |                                                                                       |
| 4/6    | RL - Policy gradients, gradient free optim.     | Imitation                                          |                                                                                       |
| 4/11   | Sequence - RNN, LSTM, GRU                       | Imitation 2                                        |                                                                                       |
| 4/13   | Sequence - Temporal conv., WaveNet              | Imitation 2                                        |                                                                                       |
| *4/17* | **HW5 is due at 11:59 PM**                      |                                                    |                                                                                       |
| 4/18   | Special topics                                  | RL                                                 |                                                                                       |
| 4/20   | Special topics                                  | RL                                                 |                                                                                       |
| 4/25   | Special topics                                  |                                                    |                                                                                       |
| 4/27   | Special topics                                  |                                                    |                                                                                       |
| 5/2    | Final presentations                             |                                                    |                                                                                       |
| 5/4    | Final presentations                             |                                                    |                                                                                       |
| *5/8*  | **Final project, makeup homework due at 11:59** |                                                    |                                                                                       |

## Grading

- Quizzes: 10% (the 2 lowest-scoring quizzes will be dropped).
- Coding/Class participation: 10% (you may miss 3 classes without an excuse).
- Homework: 50% (10% per assignment with the lowest score being dropped).
- Final project: 30%

## Late Policy

Quizzes cannot be made up if missed since we discuss the solutions immediately.
Homework may be turned in one day late at a 25% penalty or two days late for a
50% penalty. In addition, you will have three slip days for homeworks which
will be applied automatically. (For example, the first time a homework is one
day late, you will be graded as if that homework were turned in on time, and
you will lose one slip day. You would then have two slip days remaining for the
rest of the semester.) After three days homeworks will not be accepted because
the homework solutions will be released. The final project cannot be turned in
late.

## Academic Honesty

Homeworks and quizzes are to be done individually. For the final project,
groups of up to three will be allowed. You are allowed to discuss ideas and
share data, but you may not share any code. You also may not post solutions to
any assignments in a place where other people may see them. You are allowed to
look at publically available online discussions (e.g., StackOverflow) so long
as you cite any code or ideas you take from such discussions. If you are unsure
about whether a particular behavior would consistute academic dishonesty, don't
hesitate to ask the instructor. For more information on UT's academic honesty
policy, please refer to the departmental
[guidelines](https://www.cs.utexas.edu/users/ear/CodeOfConduct.html#honesty).

## Documented Disability Statement

The University of Texas at Austin guarantees that students with disabilities
have access to appropriate accommodations. You may request an accommodation
letter from the Division of Diversity and Community Engagement, Services for
Students with Disabilities https://diversity.utexas.edu/disability/.

If you have approved accommodations for the course, please contact us to
arrange them. Please do this as soon as possible, so that you can have the
benefit of the accommodations throughout the duration of the course.

## Behavioral Concerns

If you are worried about someone who is acting differently, you may use the
Behavior Concerns Advice Line to discuss by phone your concerns about another
individuals behavior. This service is provided through a partnership among the
Office of the Dean of Students, the Counseling and Mental Health Center (CMHC),
the Employee Assistance Program (EAP), and The University of Texas Police
Department (UTPD). Call 512-232-5050 or visit
https://besafe.utexas.edu/behavior-concerns-advice-line

## Acknowledgement

Note that most of this syllabus (with the exception of the calendar, the
logistics, and some wording changes) was developed by Philipp Krähenbühl and is
reused here with permission.
