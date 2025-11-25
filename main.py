import os

from rdflib import ConjunctiveGraph, Graph

cwd = os.getcwd()
file_path = os.path.join(cwd, "test.trig")

g: Graph = ConjunctiveGraph()
g.parse(file_path, format="trig")

contexts = list(g.contexts())

print(f"Total triples loaded: {len(g)}")
print("\nFirst 10 triples:")
print("-" * 80)

# Display the first 10 triples (union of all contexts)
for i, (subject, predicate, obj) in enumerate(g.triples((None, None, None)), 1):
    if i > 10:
        break
    print(f"{i}. Subject: {subject}")
    print(f"   Predicate: {predicate}")
    print(f"   Object: {obj}")
    print()
