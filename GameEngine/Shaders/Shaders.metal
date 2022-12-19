#include <metal_stdlib>
using namespace metal;

struct VertexIn {
    simd::float3 position [[ attribute(0) ]];
    simd::float4 color [[ attribute(1) ]];
};

struct RasterizerData {
    simd::float4 position [[ position ]];
    simd::float4 color;
};

vertex RasterizerData basic_vertex_shader(const VertexIn vIn [[ stage_in ]])
{
    RasterizerData data;

    data.position = float4(vIn.position, 1);
    data.color = vIn.color;

    return data;
}

fragment half4 basic_fragment_shader(RasterizerData data [[ stage_in ]] )
{
    return half4(data.color.r, data.color.g, data.color.b, data.color.a);
}
