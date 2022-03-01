---
title: "Homework 3"
date: 2022-03-01
---

For this homework, we will really tune our SuperTuxKart classifier in order to
push the accuracy as high as possible. We will then extend that classifier to
label each pixel of the input rather than each input image as a whole.

This assignment, as with all of the homework assignments, should be completed
individually without sharing solutions, models, or ideas with other students.
See details at the bottom of this page.

# Starter Code

We provide some starter code for this homework
[here](/cs342-homeworks/hw3.zip). This zip file contains the following:

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

As in the previous homework assignments, we will be using the
[SuperTuxKart dataset](https://drive.google.com/a/utexas.edu/file/d/1Gg-SblaraCKqypAKtmrGEO3wgR8uaYaL).
This data should be placed at `homework3/data/` where `homework3` is the
directory contained in the above zip file. Since you already downloaded the
dataset for the first homework, you may want to symlink the data to save
storage space.

## Tuning your Classifier (40 pts)

In this part of the homework, you will use all of the tricks at your disposal
to improve the accuracy of your classifier from homework 2. You may choose to
start either from your own solution to homework 2 or from the master solution.
Your goal is to achieve an accuracy of 90\%. In order to reach this accuracy,
you may want to use some or all of the following techniques:

- Input normalization
- Residual blocks
- Dropout
- Data augmentation
- Weight regularization
- Early stopping
- Normalization inside the network
- Anything else we've talked about in class.

The master solution for this homework achieves about 94\% accuracy on the test
set. You can earn extra credit for accuracies higher than 90\%, maxing out at
10 points if you can match the master solution.

Some relevant operations:

- [torchvision.transforms.Compose](https://pytorch.org/vision/stable/transforms.html#torchvision.transforms.Compose)
- [torchvision.transforms.ColorJitter](https://pytorch.org/vision/stable/transforms.html#torchvision.transforms.ColorJitter)
- [torchvision.transforms.RandomHorizontalFlip](https://pytorch.org/vision/stable/transforms.html#torchvision.transforms.RandomHorizontalFlip)
- [torch.nn.Dropout](https://pytorch.org/docs/stable/generated/torch.nn.Dropout.html#torch.nn.Dropout)

# Dense Prediction / Segmentation

In this part of the assignment, we will switch from classification to
segmentation. That is, rather than predicting one output label for each image,
we will predict an output label for each pixel.

In order to do this, you will need the
[dense prediction set](https://drive.google.com/open?id=1vwDx1VQeK2GJpSgW7TOulTZgB94AJ85t).
Place this dataset at `homework3/dense_data`
The images in this dataset each have a resolution of 128x96 and the labels have
the same size. In this dataset a few of the labels are merged because there are
so few instances in the dataset. Tha labels for the dense prediction set are:
background, kart, track, bomb/projectile, and pickup/nitro.

You can see a few examples from the dense prediction dataset by running

    python -m homework.utils

## FCN Design (20 pts)

In this section you will fill in the definitions in `models.py` in order to
define a fully-convolutional network (FCN). Your model should not include any
fully-connected layers. Make sure to pad correctly, match strided
convolutions with upconvolutions, and use skip and residual connections.

One thing to note here: in class we talked about residual connections, where we
take an output from earlier in the network, skip a few layers, then add that
value back into the network. There is another kind of skip connection which may
be useful for you in this context. Rather than adding the output from earlier
network layers, you can concatentate them with
[torch.cat](https://pytorch.org/docs/stable/generated/torch.cat.html#torch.cat)
in order to pass both sets of features unchanged to the next layer of the
network.

Your network should not depend on any specific input size or shape. It should
be able to work with inputs of any size and should produce an output which is
the same size as the input. Depending on how you structure your model, you may
need to use `output_padding` in the upconvolutions and you may need to crop
your output.

## FCN Training (40 pts)

Now you will train your FCN. This is a slightly different process than training
your CNN from the first part of this homework. You will need to use the
`DenseSuperTuxDataset`, which can accept a `transform` parameter to use for
data augmentation. Many of the data augmentation operations in `torchvision` do
not directly apply to dense tasks, so we provide a few operations in
`dense_transforms.py`. You will need similar tricks to train your FCN that you
used for the classifier in the first part.

The dense dataset is very unbalanced, which makes it quite easy to cheat if we
just look at pixel-wise accuracy. For example, if you can accurately predict
background and track (but fail on all other classes) your model would be 96\%
accurate. To account for that, we use the
[Intersection over Union](https://en.wikipedia.org/wiki/Jaccard_index)
evaluation metric. This is a standard way to measure the performance of
segmentation models with large class imbalances. This is measured by the
`ConfusionMatrix` class in `homework/utils.py`. You may need to change the
class weights in `CrossEntropyLoss`, although the master solution works without
doing this.

Some useful documentation:

- [torch.optim.Adam](https://pytorch.org/docs/stable/generated/torch.optim.Adam.html#torch.optim.Adam) may train faster than SGD for this problem.
- [torch.nn.ConvTranspose2d](https://pytorch.org/docs/stable/generated/torch.nn.ConvTranspose2d.html#torch.nn.ConvTranspose2d) is PyTorch's upconvolution class.

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
