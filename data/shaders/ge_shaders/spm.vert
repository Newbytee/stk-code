#include "utils/spm_layout.h"
#include "../utils/get_world_location.vert"

void main()
{
    vec4 v_world_position = getWorldPosition(
        u_object_buffer.m_objects[gl_InstanceIndex].m_position.xyz,
        u_object_buffer.m_objects[gl_InstanceIndex].m_rotation,
        u_object_buffer.m_objects[gl_InstanceIndex].m_scale.xyz, v_position);
    gl_Position = u_camera.m_projection_view_matrix * v_world_position;
    f_vertex_color = v_color.zyxw;
    f_uv = v_uv + u_object_buffer.m_objects[gl_InstanceIndex].m_texture_trans;
    f_uv_two = v_uv_two;
    f_material_id = u_object_buffer.m_objects[gl_InstanceIndex].m_material_id;
}
