# Captcha-Bot
The task was to solve the captcha shown in the screenshot in real time, this was necessary to gain an advantage in the online game

How it works? Two stripes with pixels are read from the screen (s1 and s2 on the image), after which a graph of the difference in colors between them is plotted. Depending on the length of the gap where the difference in color exceeds a certain threshold, a letter is assigned to the gap:
- s - short;
- l - long.

After scanning the graph, a string of symbols is collected, the example shows the string "llsslllsss", it searches for the values of interest to us according to pre-prepared templates (v1 and v2 in the image).
