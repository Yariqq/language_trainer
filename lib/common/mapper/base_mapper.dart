abstract class BaseMapper<Entity, Bean> {
  Entity mapFromBean(Bean src);

  Bean mapToBean(Entity src);
}
