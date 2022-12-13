#include <metal_stdlib>
using namespace metal;

struct VertexIn {
    simd::float3 position;
    simd::float4 color;
};

struct RasterizerData {
    simd::float4 position [[ position ]];
    simd::float4 color;
};

vertex RasterizerData basic_vertex_shader(const device VertexIn *vertices [[buffer(0)]],
                                  uint vertexID [[vertex_id]])
{
    RasterizerData data;

    data.position = float4(vertices[vertexID].position, 1);
    data.color = vertices[vertexID].color;

    return data;
}

fragment half4 basic_fragment_shader(RasterizerData data [[ stage_in ]] )
{
    return half4(data.color.r, data.color.g, data.color.b, data.color.a);
}
