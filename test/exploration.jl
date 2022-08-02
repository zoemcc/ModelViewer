using Lux
using GLMakie
using Makie
using Random
using GraphMakie
using Graphs

GLMakie.activate!()
GLMakie.set_window_config!(float=true)
#f = Figure(fontsize=30)

#g = complete_graph(10)
#graphplot(g)

# meshscatter for the image plots
# graphplot for the layout

scene = Scene(backgroundcolor=:gray)
subwindow = Scene(scene, px_area=Rect(100, 100, 200, 200), clear=true, backgroundcolor=:white)#
scene
#cam3d!(subwindow)
#meshscatter!(subwindow, rand(Point3f, 10), color=:gray)
center!(subwindow)
scene
campixel!(subwindow)
w, h = size(subwindow) # get the size of the scene in pixels
# this draws a line at the scene window boundary
image!(subwindow, [sin(i/w) + cos(j/h) for i in 1:w, j in 1:h])
scene

parent = Scene()
cam3d!(parent)

# One can set the camera lookat and eyeposition, by getting the camera controls and using `update_cam!`
camc = cameracontrols(parent)
update_cam!(parent, camc, Vec3f(0, 8, 0), Vec3f(4.0, 0, 0))

s1 = Scene(parent, camera=parent.camera)
mesh!(s1, Rect3f(Vec3f(0, -0.1, -0.1), Vec3f(5, 0.2, 0.2)))
s2 = Scene(s1, camera=parent.camera)
mesh!(s2, Rect3f(Vec3f(0, -0.1, -0.1), Vec3f(5, 0.2, 0.2)), color=:red)
translate!(s2, 5, 0, 0)
s3 = Scene(s2, camera=parent.camera)
mesh!(s3, Rect3f(Vec3f(-0.2), Vec3f(0.4)), color=:blue)
translate!(s3, 5, 0, 0)
parent
im1 = Scene(s3, camera=parent.camera)
heatmap!(im1, randn(20,20))
translate!(im1, -10, -4, 0)
parent


