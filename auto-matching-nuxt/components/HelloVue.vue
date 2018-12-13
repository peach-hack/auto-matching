<template>
  <div>
    <h1>Hello {{ value | convertUpperCase }}</h1>
    <input type="text"
:value="inputValue" @input="handleInput($event)"
/>
    <button :disabled="isDisabled"
@click="handleClick()"
>
button
</button>
  </div>
</template>

<script lang="ts">
import { Component, Prop, Watch, Vue } from "nuxt-property-decorator";

@Component({
  /** filters */
  filters: {
    convertUpperCase(value: string): string | null {
      if (!value) {
        return null;
      }
      return value.toUpperCase();
    }
  }
})
export default class HelloVue extends Vue {
  /** props */
  @Prop()
  val: string = "";

  /** data */
  value: string = this.val;

  inputValue: string = "";

  /** watch */
  @Watch("value")
  onValueChange(newValue: string, oldValue: string): void {
    console.log(`watch: ${newValue}, ${oldValue}`);
  }

  /** computed */
  get isDisabled(): boolean {
    return this.inputValue === "";
  }

  /** methods */
  handleInput($event: Event): void {
    this.inputValue = (($event.target as any) as HTMLInputElement).value;
  }

  handleClick(): void {
    if (this.inputValue === "") {
      return;
    }
    this.value = this.inputValue;
    this.inputValue = "";
    this.$emit("handle-click", this.value);
  }
}
</script>
