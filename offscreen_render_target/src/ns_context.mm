#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>

#import <OpenGL/OpenGL.h>
#import <OpenGL/gl.h>


NSOpenGLContext *OGL_context;

void create_context_NS()
{
    NSOpenGLPixelFormatAttribute pixelFormatAttributes[] = {
        NSOpenGLPFAOpenGLProfile,
        (NSOpenGLPixelFormatAttribute)NSOpenGLProfileVersion4_1Core,
        NSOpenGLPFADoubleBuffer,
        NSOpenGLPFAAccelerated, 0,
        0
    };

    NSOpenGLPixelFormat *_pixelFormat = [[NSOpenGLPixelFormat alloc] initWithAttributes:pixelFormatAttributes];
	if (_pixelFormat == nil) {
		NSLog(@"Error: No appropriate pixel format found");
	}
    OGL_context = [[NSOpenGLContext alloc] initWithFormat:_pixelFormat shareContext:nil];
    [OGL_context makeCurrentContext];

	if (OGL_context == nil) {
		NSLog(@"Unable to create an OpenGL context. The GPUImage framework requires OpenGL support to work.");
	}
}

void activate_context_NS()
{
    if ([NSOpenGLContext currentContext] != OGL_context) {
        [OGL_context makeCurrentContext];
    }
}

void deactivate_context_NS()
{
    if ([NSOpenGLContext currentContext] == OGL_context) {
        [OGL_context clearCurrentContext];
    }
}