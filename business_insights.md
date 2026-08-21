# Business Insights — HR Attrition Analytics

Notes from looking at the IBM HR Analytics dataset (1,470 employees)
with Python, SQL, and Power BI.

## Overall attrition

16.12% of employees in this dataset left the company (237 out of
1,470). This is the number everything else gets compared to.

## Overtime is the biggest factor

This was the strongest pattern I found. Employees who work overtime
leave almost 3x more often than those who don't — 30.53% vs 10.44%.
Nothing else I looked at was this big of a gap.

## Entry-level roles have the most risk

Attrition is not spread evenly across the company. It's mostly in
lower-level, lower-paid jobs:

- **Sales Representative** has the highest attrition of any role,
  39.76%. This is based on 83 people, so it's a real pattern, not
  just a few random cases.
- Inside Sales, attrition goes down a lot as the job level goes up:
  Representative (39.76%) → Executive (17.48%) → Manager (5.41%).
- **Job Level 1** (the lowest level) is the biggest group in the
  company (543 people, about 37% of everyone) and also has the
  highest attrition (26.34%), with the lowest pay (£2,786/month —
  about half of Level 2).

So this looks less like "Sales has a problem" and more like
"entry-level jobs across the company have a problem."

## Pay and tenure matter, but overtime and job level matter more

People who left earned about 30% less on average (£4,787 vs £6,833)
and had less time at the company (5 years vs 7). They were also
younger (33 vs 37). But they had worked at about the same number of
past companies as people who stayed (2 vs 2). So they don't look
like people who just switch jobs a lot — something about these
specific roles seems to push people out.

## Job satisfaction follows the pattern you'd expect

Attrition goes down as job satisfaction goes up — from 22.84% at
the lowest satisfaction level to 11.33% at the highest. It's worth
noting attrition never hits zero, even at the highest satisfaction
level. So satisfaction alone doesn't explain everything — overtime
and job level seem to matter more.

## One thing to be careful about

HR as a department only has 63 people, so its attrition number
should be read carefully. A couple of people leaving or staying can
move that percentage a lot more than in a bigger department like
R&D (961 people).

## What I'd focus on

If I were advising this company, overtime and support for
entry-level employees look like the two biggest opportunities. They
are the strongest patterns in the data, and unlike age or tenure,
they're things a company can actually change.
