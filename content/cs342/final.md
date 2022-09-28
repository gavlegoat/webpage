---
title: "Final Project"
date: 2022-04-18
---

In this project, you will implement an agent that plays the SuperTuxKart ice
hockey game mode. You have two options for how to do this: an image-based agent
or a state-based agent.

Regardless of which agent you choose, your goal is to train the agent to score
as many goals as possible in a 2 vs. 2 tournament against some existing agents.

**Note**: In contrast to previous homeworks, you may work in groups of up to
four students on this assignment. You are not _required_ to work in groups, but
you are allowed to. If you decide to work in a group please have one team
member email me with the names and eid's of everyone in your group. (I need
this information in order to set up Canvas to accept one submission for the
whole group.)

I strongly recommend you get started early and test your code on a linux
machine -- either a CS lab machine or Colab.

## Image-based Agents

The image-based agents can look at the state of the player's karts, but not the
underlying state of the puck or the opponent's karts. Instead, the agent sees
an image from each of the player karts, from which is must infer the location
of the puck and two opponents karts. For this solution, you will be working
mostly on vision. You should choose this route if you want to use a handwritten
controller and spend more time working on the vision component. This path will
likely require more computational resources to develop and train.

If you choose to go with this option, you will implement
`image_agent/player.py`.

Specific rules for the image-based option:

- You must use a deep network to process the images.
- You may use any controller you want, and you may look at the agents included
  in the starter code to write the controller.
- There is a time limit of 50ms per step (that is, per call to the `Team.act`
  function) on a reasonably fast GPU.

## State-based Agent

The state-based agent gets access to the states of the player's karts, the
puck, and the opponent's karts. This agent does not require any vision
component. This approach must learn a controller, so you should choose this
path if you'd rather focus on reinforcement learning.

If you choose to go with this option, you will implement
`state_agent/player.py`.

Specific rules for the state-based option:

- Your agent must be implemented by a single deep newtork, with no
  hand-designed components.
- There is a time limit of 10ms per step (that is, per call to the `Team.act`
  function) on a reasonably fast GPU.

# Getting Started

Starter code for the final project is [here](/cs342-homeworks/final.zip).

Regardless of which path you choose to take, you will need to implement the
`Team` class in `player.py`. This class provides the function `act`, which
takes an input (which will differ depending on which task you choose) and
produces a list of actions (one action per player). The current implementation
just drives straight ahead as an example. You can test your agents against the
agents included in the starter code or against the built-in AI, using

    python -m tournament.runner image_agent AI

(or `state_agent` if you chose the state-based route). The tournament runner
has a lot of options. Use the `-h` option to see them all. You may find `-r`
and `-s` particularly useful.

**Note**: During training, you may use any functionality from `pystk` that you
like. During grading however, you should not call any functions from `pystk`.

Regardless of which type of agent you choose, it might be helpful to make use of
`torch.jit.script` objects. These are PyTorch objects which store model
parameters together with model architecture so you can load an entire model
without needing to keep the model source code around. To create and save a
`torch.jit.script` object:

    script = torch.jit.script(model)
    torch.jit.save(script, '<model-filename>.pt')

Then you can load your script with `torch.jit.load('<model-filename>.pt')`.
See the included agents for some examples.


# Tournament (extra credit)

For each of the two agent types, we will run a tournament between all
submissions of that type. Each game will be played 2v2 to a maximum of three
goals or 1200 time steps. Depending on the number of submissions, we may either
do a round-robin with all the submissions, or we may do a group stage followed
by a round-robin for the top eight submissions. The team which wins the most
matches will win the tournament, with ties broken by the total number of goals
scored. If tie-breaks are still necessary at that point, we'll run more matches
between the tied agents.

# Online Grader

There will be an online-grader on Canvas for this assignment, but it will not
completely grade your project. Rather, the online grader performs a few basic
checks to make sure your code can be run on the grading system.

# Writeup and Presentation

For this assignment, you will need to write a report describing your solutions.
Your writeup should address (at least) the following questions:

- How does your solution work? What is your model architecture?
- How did you train your model? Include hyperparameter values.
- Why did you choose that model, that training process, and those hyperparamter
  values?
- What else did you try before arriving at your solution?
- Why do you think your current solution works? Include some data from testing
  here.

The structure of the writeup is up to you, but I will ask you to keep it under
12 pages. Note that I _do not_ necessarily expect you to use all 12 pages. I am
just imposing a limit to make sure I can read them all in a reasonable time
frame. If you feel you need more than 12 pages, you may move tables, diagrams,
etc. to an appendix, but keep the text under 12 pages.

You will also need to prepare and give a presentation detailing the same
information as the report. Currently I'm targeting 10 minutes per presentation,
but depending on how many groups we have we may need to expand or restrict that
time frame. Given that time limit, you may need to skip some information from
the writeup, but you should try to cover the most important issues. Note that
the time we have in-class for giving presentations is before the final project
deadline, so your presentation may describe work-in-progress, or your solution
may change before you submit it. That's totally fine.

# Grading

The grading for the final project is broken down as follows:

- 10 pts for the presentation
- 30 pts for the originality of the idea. This will be based on what things
  you've tried and how well you understand your agent (judged based on the
  writeup).
- 30 pts for the average number of goals per game. This is scaled linearly from
  zero to one, i.e., you'll get full credit for scoring at least one goal per
  game.
- 30 pts for the writeup. This is based on the quality of the writing -- how
  well is the writeup structured, how well is the solution explained, etc.
- 15 pts (extra credit) for the tournament. The top three teams per agent type
  will receive 15, 10, and 5 bonus points.

# Submission

Once you are ready to submit, create a bundle by running

    python bundle.py <state_agent OR image_agent> <eid>

then submit the resulting zip file on Canvas. Make sure to submit your writeup
to the appropriate Canvas assignment as well.

# Honor Code

You may work with up to three other students on this project. Otherwise, the
same restrictions on collaborations apply as for all other assignments. You are
allowed to discuss high-level ideas and general structure with other teams, but
not specific details about code, architecture, or hyperparameters. You may
consult online sources, but don't copy code directly from any posts you find.
Cite any ideas you take from online sources in your code (include the full URL
where you found the idea). You may refer to your own solutions or the master
solutions to prior homework assignments from this class as well as any iPython
notebooks from this class. **Do not put your solution in a public place (e.g.,
a public GitHub repo)**.

# Acknowledgements

This assignment is very lightly modified from one created by Philipp
Krähenbühl.
