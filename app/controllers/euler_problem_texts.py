import requests, json
from bs4 import BeautifulSoup

URL = "https://projecteuler.net/problem={}"

def getBS(url):
    r  = requests.get(url)
    data = r.text
    return BeautifulSoup(data,"lxml")

problems = {}
for i in range(1, 701):
    print(i)
    problem = getBS(URL.format(i))
    problem_tag = problem.find("div", {"class":"problem_content"})
    problem_title = problem.find("h2").text
    problem_html = str(problem_tag).replace("project/images/", "https://projecteuler.net/project/images/")
    problems[i] = {"title":problem_title, "problem":problem_html}

open("problems.json", "w"). write(json.dumps(problems, ensure_ascii=False, indent=4))