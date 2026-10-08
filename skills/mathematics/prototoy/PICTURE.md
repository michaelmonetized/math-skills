# Picture branch

1. **Pick the representation** that answers the question: function graph, level sets or contour plot, phase portrait for an ODE, scatter of a point set, matrix heat map, graph drawing with a chosen layout, complex function via domain colouring.
2. **Generate several variants** side by side: different parameter values, scales (linear vs log), or projections. One picture invites over-interpretation.
3. **Tools.** matplotlib from Python; SageMath's `plot`, `implicit_plot`, `complex_plot`, and `Graph.plot()`; networkx for graph layouts. Save to `scratch/proto-<name>-*.png` and open it for the user.
4. **Annotate honestly.** Title each panel with the parameters, the sampling resolution, and any clipping. Plots miss thin features and singularities between sample points; say what resolution was used.
