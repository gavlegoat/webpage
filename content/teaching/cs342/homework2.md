---
title: "Homework 2"
date: 2022-02-14
---

For this homework, you will be classifying images from the SuperTuxKart dataset
using a convolutional neural network.

This assignment, as with all of the homework assignments, should be completed
individually without sharing solutions, models, or ideas with other students.
See details at the bottom of this page.

# Starter Code

We provide some starter code for this homework
[here](/cs342-homeworks/hw2.zip). This zip file contains the following:

- `bundle.py`, a script you can use to zip up your homework for submission. In
  order to submit your homework, run `python bundle.py homework <uteid>` which
  will create a file called `<uteid>.zip`. This is the file you should submit.
- `grader` contains a local grader which you can use to evaluate your homework
  and see what grade you would currently get. Note that the local grader and
  our grader use different test sets, so this grader is not guaranteed to be
  100% accurate.
- `homework` contains the code you will modify for this assignment.

You can run the local grader at any time by using the following command:

    python -m grader homework -v

As in the first homework assignment, we will be using the [SuperTuxKart dataset](https://drive.google.com/a/utexas.edu/file/d/1Gg-SblaraCKqypAKtmrGEO3wgR8uaYaL).
This data should be placed at `homework2/data/` where `homnework2` is the
directory contained in the above zip file. Since you already downloaded the
dataset for the first homework, you may want to symlink the data to save
storage space.

## CNN Model (10 pts)

For this section, you will implement the `CNNClassifier` class in `models.py`.
As in the first homework, your model should return a `(B, 6)` tensor
representing the logits of the classes. However, for this assignment your model
should use convolutional layers rather than (or in addition to) fully connected
layers.

Take a look at [torch.nn.Conv2d](https://pytorch.org/docs/stable/generated/torch.nn.Conv2d.html#torch.nn.Conv2d).

## Logging (30 pts)

In this part, you will have to use tensorboard to log training data. Inside of
`homework/acc_logging.py` there is a dummy training procedure and two
`tb.SummaryWriter` objects. Your task is to use those two `SummaryWriter`
objects to log the training loss at each *iteration*, the training accuracy at
each *epoch* and the validation accuracy at each epoch. A simple example of
tensorboard usage is

    import torch.utils.tensorboard as tb
    logger = tb.SummaryWriter('cnn')

    logger.add_scalar('train/loss', t_loss, 0)

There are more examples of tensorboard usage in the in-class exercises we have
been working on this semester.

Note that you should *not* create your own `SummaryWriter` object inside
`acc_logging.py` because that will break the grader. Use the two provided
objects instead.

You can test the logger by running `python3 -m homework.acc_logging <log>`
where `<log>` is the name of some directory. Then start tensorboard with
`tensorboard --logdir <log>` to view the results of the logging.

## Training your CNN (60 pts)

The bulk of this homework is in this section, where we train a CNN to classify
SuperTuxKart images. For this, you will likely want to reuse some of your
training code from the first homework. I would also recommend using the logging
functionality from the previous section to track your runs. This will help you
to tune your hyperparameters. Once your model is trained, you can visualize its
outputs for a few inputs by running `python -m homework.viz_prediction <dataset>`.

You can use `python -m grader homework -v` to test your solution.  We are
looking for an accuracy of at leats 85\% for full credit, but once again, our
grader uses a test dataset which is different from the dataset used by the
local grader.

Note that the grader does not do any transformation on the dataset -- if you
want to normalize the input images, do it in `models.py`.

# Grading

The test grader can be run with

    python -m grader homework -v

Note that this grader is using a different set of test data than we use for our
grader, so there may be some difference between the two. The distributions will
be the same so your grade should be similar between the two graders, unless the
model is massively overfit to the validation set.

# Submission

Once you are ready to submit, create a bundle by running

    python bundle.py homework <eid>

then submit the resulting zip file on Canvas. Note that the grader has a
maximum file size limit of 20MB. You shouldn't run into this limit unless your
models are much larger than they need to be. You can check that your homework
was bundled properly by grading it again with

    python -m grader <eid>.zip

# Online Grader

The online grading system uses a slightly modified version of Python, so please
make sure your code follows these rules:
- Do not use `exit` or `sys.exit` as this will likely crash the grader.
- Do not try to access files except for the ones provided with the homework zip
  file. Writing files is disabled.
- Network access is disabled in the grader. Make sure you are reading your
  dataset from the `data` folder rather than from a network connection
  somewhere.
- Do not fork or spawn new processes.
- `print` and `sys.stdout.write` are ignored by the grader.

# Honor Code

You should do this homework individually. You are allowed to discuss high-level
ideas and general structure with each other, but not specific details about
code, architecture, or hyperparameters. You may consult online sources, but
don't copy code directly from any posts you find. Cite any ideas you take from
online sources in your code (include the full URL where you found the idea).
You may refer to your own solutions or the master solutions to prior homework
assignments from this class as well as any iPython notebooks from this class.
**Do not put your solution in a public place (e.g., a public GitHub repo)**.

# Acknowledgements

This assignment is very lightly modified from one created by Philipp
Krähenbühl.
