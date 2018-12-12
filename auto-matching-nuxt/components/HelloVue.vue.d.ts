import { Vue } from "nuxt-property-decorator";
export default class HelloVue extends Vue {
    val: string;
    value: string;
    inputValue: string;
    clickButton(val: string): void;
    onValueChange(newValue: string, oldValue: string): void;
    readonly isDisabled: boolean;
    handleInput($event: Event): void;
    handleClick(): void;
}
